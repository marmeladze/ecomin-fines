module Admin
  class MaterialVolumesController < ApplicationController
    before_action :set_material_volume, only: [:show, :edit, :update, :destroy]

    # GET /material_volumes
    # GET /material_volumes.json
    def index
      @material_volumes = MaterialVolume.all
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

      respond_to do |format|
        if @material_volume.save
          format.html { redirect_to @material_volume, notice: 'Material volume was successfully created.' }
          format.json { render :show, status: :created, location: @material_volume }
        else
          format.html { render :new }
          format.json { render json: @material_volume.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /material_volumes/1
    # PATCH/PUT /material_volumes/1.json
    def update
      respond_to do |format|
        if @material_volume.update(material_volume_params)
          format.html { redirect_to @material_volume, notice: 'Material volume was successfully updated.' }
          format.json { render :show, status: :ok, location: @material_volume }
        else
          format.html { render :edit }
          format.json { render json: @material_volume.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /material_volumes/1
    # DELETE /material_volumes/1.json
    def destroy
      @material_volume.destroy
      respond_to do |format|
        format.html { redirect_to material_volumes_url, notice: 'Material volume was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_material_volume
        @material_volume = MaterialVolume.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def material_volume_params
        params.fetch(:material_volume, {})
      end
  end
end
