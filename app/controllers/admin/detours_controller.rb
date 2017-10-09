module Admin
  class DetoursController < ApplicationController
    before_action :set_detour, only: [:show, :edit, :update, :destroy]

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

      respond_to do |format|
        if @detour.save
          format.html { redirect_to @detour, notice: 'Detour was successfully created.' }
          format.json { render :show, status: :created, location: @detour }
        else
          format.html { render :new }
          format.json { render json: @detour.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /detours/1
    # PATCH/PUT /detours/1.json
    def update
      respond_to do |format|
        if @detour.update(detour_params)
          format.html { redirect_to @detour, notice: 'Detour was successfully updated.' }
          format.json { render :show, status: :ok, location: @detour }
        else
          format.html { render :edit }
          format.json { render json: @detour.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /detours/1
    # DELETE /detours/1.json
    def destroy
      @detour.destroy
      respond_to do |format|
        format.html { redirect_to detours_url, notice: 'Detour was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_detour
        @detour = Detour.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def detour_params
        params.fetch(:detour, {})
      end
  end
end