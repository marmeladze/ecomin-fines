module Admin
  class HeightRangesController < BaseController
    before_action :logged_in_user
    before_action :set_height_range, only: [:show, :edit, :update, :destroy]
    before_action :set_related, only: [:edit, :new]

    def index
      @height_ranges = HeightRange.order(id: :desc)
    end


    def show
    end


    def new
      @height_range = HeightRange.new
    end


    def edit
    end


    def create
      height_range_params = final_params(params[:range_min], params[:range_max])

      @height_range = HeightRange.new(height_range_params)  

      if @height_range.save
        redirect_to admin_height_ranges_path, notice: 'Height range was successfully created.'
      else
        render :new
      end
    end


    def update
      height_range_params = final_params(params[:range_min], params[:range_max])
     
      if @height_range.update(height_range_params)
        redirect_to admin_height_ranges_path, notice: 'Height range was successfully updated.'
      else
        render :edit
      end

    end


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

    def set_height_range
      @height_range = HeightRange.find(params[:id])
    end

    def pre_params
      params.require(:height_range).permit(:classification_id, :tree_id, :diameter, :h_range)
    end

    def final_params mn, mx
      l = mn.to_f || 5.0
      u = mx.to_f || 6.5
      rng = (l..u)
      return pre_params.merge({h_range: rng})
    end
  end
end