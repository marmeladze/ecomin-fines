module Admin
  class ForestriesController < BaseController
    before_action :set_forestry, only: [:show, :edit, :update, :destroy]
    before_action :set_related, only: [:new, :edit]

    def index
      @forestries = Forestry.with_region
    end


    def show
    end


    def new
      @forestry = Forestry.new
    end


    def edit
    end


    def create
      @forestry = Forestry.new(forestry_params)

      if @forestry.save
        redirect_to admin_forestries_path(@forestry), notice: 'Forestry was successfully created.'
      else
        render :new
      end

    end

    def update

      if @forestry.update(forestry_params)
        redirect_to admin_forestries_path(@forestry), notice: 'Forestry was successfully updated.'
      else
        render :edit
      end
    end


    def destroy
      @forestry.destroy
      redirect_to forestries_url, notice: 'Forestry was successfully destroyed.'
    end

    private

    def set_related
      @regions = Region.pluck(:name, :id)
    end

    def set_forestry
      @forestry = Forestry.find(params[:id])
    end


    def forestry_params
      params.require(:forestry).permit(:name, :region_id, :description)
    end
  end
end
