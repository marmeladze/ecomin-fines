module Admin
  class DetoursController < BaseController
    before_action :logged_in_user
    before_action :set_detour,  only: [:show, :edit, :update, :destroy]
    before_action :set_related, only: [:new, :edit]

    # GET /detours
    # GET /detours.json
    def index
      @detours = Detour.all
    end

    # GET /detours/1
    # GET /detours/1.json
    def show
    end

    # GET /detours/new
    def new
      @detour = Detour.new
    end

    # GET /detours/1/edit
    def edit
    end

    # POST /detours
    # POST /detours.json
    def create
      @detour = Detour.new(detour_params)
      if @detour.save
        redirect_to admin_detours_path, notice: 'Detour was successfully created.'
      else
        render :new
      end
    end


    def update
      if @detour.update(detour_params)
        redirect_to admin_detours_path, notice: 'Detour was successfully updated.'
      else
        render :edit
      end
    end


    def destroy
      @detour.destroy
      redirect_to admin_detours_url, notice: 'Detour was successfully destroyed.'
    end

    private

    def set_related
      @forestries = Forestry.with_region
    end

    def set_detour
      @detour = Detour.find(params[:id])
    end

    def detour_params
      params.require(:detour).permit(:name, :forestry_id, :description)
    end

  end
end