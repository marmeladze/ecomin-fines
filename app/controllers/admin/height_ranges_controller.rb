module Admin
  class HeightRangesController < ApplicationController
    before_action :set_height_range, only: [:show, :edit, :update, :destroy]
    before_action :set_related, only: [:edit, :new]

    def index
      @height_ranges = HeightRange.all
    end


    def show
    end


    def new
      @height_range = HeightRange.new
    end


    def edit
    end


    def create
      r_min = params[:range_min] || 5.0
      r_max = params[:range_max] || 7.5
      h_range = "numrange(#{r_min}, #{r_max}, '[]')"
      height_range_params = pre_params.except(:range_min, :range_max)
      
      @height_range = HeightRange.new(height_range_params)  

      if @height_range.save
        HeightRange.where(id: @height_range.id).update_all(stmt)
        redirect_to admin_height_ranges_path, notice: 'Height range was successfully created.'
      else
        render :new
        render json: @height_range.errors, status: :unprocessable_entity
      end

    end


    def update
      r_min = params[:range_min].to_f
      r_max = params[:range_max].to_f
      h_range = "numrange(#{r_min}, #{r_max}, '[]')"

      height_range_params =  pre_params.merge({h_range: h_range})
     
      if @height_range.unusual_update(height_range_params)
        redirect_to admin_height_ranges_path, notice: 'Height range was successfully updated.'
      else
        render :edit
      end

    end

    # DELETE /height_ranges/1
    # DELETE /height_ranges/1.json
    def destroy
      @height_range.destroy
      respond_to do |format|
        format.html { redirect_to height_ranges_url, notice: 'Height range was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    def set_related
      @classifications = Classification.pluck(:name, :id)
      @trees = Tree.pluck(:name, :id)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_height_range
      @height_range = HeightRange.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pre_params
      params.require(:height_range).permit(:classification_id, :tree_id, :diameter, :h_range)
    end

  end
end