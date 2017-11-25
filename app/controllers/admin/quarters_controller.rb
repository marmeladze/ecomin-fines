module Admin
  class QuartersController < BaseController
    before_action :set_quarter, only: [:show, :edit, :update, :destroy]
    before_action :set_related, only: [:new, :edit]

    def index
      @quarters = Quarter.with_all_parents
    end

    def show
    end

    def new
      @quarter = Quarter.new
    end

    def edit
    end

    def create
      @quarter = Quarter.new(quarter_params)

      if @quarter.save
        redirect_to admin_quarters_path notice: 'Quarter was successfully created.'
      else
        render :new
      end

    end


    def update
      if @quarter.update(quarter_params)
        redirect_to admin_quarters_path, notice: 'Quarter was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @quarter.destroy
      redirect_to admin_quarters_url, notice: 'Quarter was successfully destroyed.'
    end

    private

    def set_related
      @detours = Detour.pluck(:name, :id)
    end

    def set_quarter
      @quarter = Quarter.find(params[:id])
    end

    def quarter_params
      params.require(:quarter).permit(:name, :lat, :lng, :detour_id)
    end
  end
end