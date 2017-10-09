module Admin
  class ForestriesController < ApplicationController
    before_action :set_forestry, only: [:show, :edit, :update, :destroy]

    # GET /forestries
    # GET /forestries.json
    def index
      @forestries = Forestry.all
    end

    # GET /forestries/1
    # GET /forestries/1.json
    def show
    end

    # GET /forestries/new
    def new
      @forestry = Forestry.new
    end

    # GET /forestries/1/edit
    def edit
    end

    # POST /forestries
    # POST /forestries.json
    def create
      @forestry = Forestry.new(forestry_params)

      respond_to do |format|
        if @forestry.save
          format.html { redirect_to @forestry, notice: 'Forestry was successfully created.' }
          format.json { render :show, status: :created, location: @forestry }
        else
          format.html { render :new }
          format.json { render json: @forestry.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /forestries/1
    # PATCH/PUT /forestries/1.json
    def update
      respond_to do |format|
        if @forestry.update(forestry_params)
          format.html { redirect_to @forestry, notice: 'Forestry was successfully updated.' }
          format.json { render :show, status: :ok, location: @forestry }
        else
          format.html { render :edit }
          format.json { render json: @forestry.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /forestries/1
    # DELETE /forestries/1.json
    def destroy
      @forestry.destroy
      respond_to do |format|
        format.html { redirect_to forestries_url, notice: 'Forestry was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_forestry
        @forestry = Forestry.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def forestry_params
        params.fetch(:forestry, {})
      end
  end
end
