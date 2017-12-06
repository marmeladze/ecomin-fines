module Admin
  class MaterialVolumesController < BaseController
    before_action :logged_in_user
    before_action :set_material_volume, only: [:show, :edit, :update, :destroy]
    before_action :set_related, only: [:edit, :new]

    # GET /material_volumes
    # GET /material_volumes.json
    def index
      @material_volumes = MaterialVolume.order(id: :desc)
    end

    # GET /material_volumes/1
    # GET /material_volumes/1.json
    def show
    end

    # GET /material_volumes/new
    def new
      @material_volume = MaterialVolume.new
    end

    # GET /material_volumes/1/edit
    def edit
    end

    # POST /material_volumes
    # POST /material_volumes.json
    def create
      @material_volume = MaterialVolume.new(material_volume_params)

      if @material_volume.save
        redirect_to admin_material_volumes_path, notice: 'Material volume was successfully created.'
      else
        render :new
      end

    end

    # PATCH/PUT /material_volumes/1
    # PATCH/PUT /material_volumes/1.json
    def update
      if @material_volume.update(material_volume_params)
        redirect_to admin_material_volumes_path, notice: 'Material volume was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /material_volumes/1
    # DELETE /material_volumes/1.json
    def destroy
      @material_volume.destroy
      redirect_to material_volumes_url, notice: 'Material volume was successfully destroyed.'
    end

    private


    def set_related
      @classifications = Classification.pluck(:name, :id)
      @trees = Tree.pluck(:name, :id)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_material_volume
      @material_volume = MaterialVolume.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def material_volume_params
      params.require(:material_volume).permit(:classification_id, :tree_id, :large, :mid, 
      :small, :combustible, :garbage, :umbrella, :diameter)
    end
    
  end
end
