module Admin
  class BaseController < ApplicationController
    before_action :logged_in_user
    layout "admin"

    def index
      @regions = Region.having_forestries
      @detours = Detour.pluck(:name, :id)
      @quarters = ActiveRecord::Base.connection.select_all("SELECT name, id FROM quarters").rows
      @trees = Tree.pluck(:name, :id)
      @classifications = Classification.pluck(:name, :id)
      @tariffs = Tariff.pluck(:name, :id)
    end

    def my_reports
      @verbatims = @current_user.reports.pluck(:verbatim).uniq
      render 'reports'
    end

    def load_forestries 
      region_id = params[:region_id] || Region.first
      @forestries = Forestry.where(region_id: region_id).pluck(:name, :id)
      respond_to do |format|
        format.json { render json: @forestries }
      end
    end

    def load_report
      @report_rows  = Report.where(verbatim: params[:verbatim])
      @general = @report_rows.first
      render 'report'
    end

    def create_report
      report = Report.new report_params 
      verbatim = [
        params[:classification_id], 
        params[:user_id], 
        params[:region_id],
        params[:forestry_id], 
        params[:detour_id],
        params[:tariff_id],
        params[:quarter_id]
      ].push(Date.today.to_s).join("-")
      report.verbatim = Digest::MD5.hexdigest(verbatim)
      if report.save
        render plain: "Cədvəl tərtib olundu.  <a href=#{load_report_url(verbatim: report.verbatim)}>Keçid</a> "
      else
        render plain: "Error while creating report entity"
      end
    end

    def search
      @material, @semi, @comb = [
        params[:material] || 1, 
        params[:semi_material] || 1, 
        params[:combustible] || 1
      ].map(&:to_i)
      @sum = @material + @semi + @comb
      @region = Region.find(params[:region] || 2 )
      @forestry = Forestry.find(params[:forestry] || 1 )
      @detour = Detour.find(params[:detour] || 1 )      
      @quarter = Quarter.find(params[:quarter] || 1)
      @results = Search
                  .by_tree(params[:tree_id])
                  .by_diameter(params[:diameter])
                  .by_tariff(params[:tariff_id])
                  .by_classification(params[:classification_id])
      if request.xhr?
        render partial: 'table_items', layout: false
      else 
        render :results
      end
    end

    private

    def report_params
      params
        .permit(
           :classification_id,
           :region_id,
           :forestry_id,
           :detour_id,
           :quarter_id,
           :tree_id,
           :diameter,
           :tariff_id,
           :material_count,
           :semi_material_count,
           :combustible_count,
           :material_large_volume,
           :material_large_price,
           :material_mid_volume,
           :material_mid_price,
           :material_small_volume,
           :material_small_price,
           :combustible_volume,
           :combustible_price,
           :garbage_volume,
           :garbage_price,
           :umbrella_volume,
           :umbrella_price,
           :user_id
        )
    end    

  end
end
    