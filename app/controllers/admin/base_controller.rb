module Admin
  class BaseController < ApplicationController
    layout "admin"

    def index
      @regions = Region.having_forestries
      @detours = Detour.pluck(:name, :id)
      @quarters = ActiveRecord::Base.connection.select_all("SELECT name, id FROM quarters").rows
      @trees = Tree.pluck(:name, :id)
      @classifications = Classification.pluck(:name, :id)
      @tariffs = Tariff.pluck(:name, :id)
    end

    def load_forestries 
      region_id = params[:region_id] || Region.first
      @forestries = Forestry.where(region_id: region_id).pluck(:name, :id)
      respond_to do |format|
        format.json { render json: @forestries }
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
  end
end

