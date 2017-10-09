module Admin
  class CompensationRatesController < ApplicationController
    before_action :set_compensation_rate, only: [:show, :edit, :update, :destroy]

    # GET /compensation_rates
    # GET /compensation_rates.json
    def index
      @compensation_rates = CompensationRate.all
    end

    # GET /compensation_rates/1
    # GET /compensation_rates/1.json
    def show
    end

    # GET /compensation_rates/new
    def new
      @compensation_rate = CompensationRate.new
    end

    # GET /compensation_rates/1/edit
    def edit
    end

    # POST /compensation_rates
    # POST /compensation_rates.json
    def create
      @compensation_rate = CompensationRate.new(compensation_rate_params)

      respond_to do |format|
        if @compensation_rate.save
          format.html { redirect_to @compensation_rate, notice: 'Compensation rate was successfully created.' }
          format.json { render :show, status: :created, location: @compensation_rate }
        else
          format.html { render :new }
          format.json { render json: @compensation_rate.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /compensation_rates/1
    # PATCH/PUT /compensation_rates/1.json
    def update
      respond_to do |format|
        if @compensation_rate.update(compensation_rate_params)
          format.html { redirect_to @compensation_rate, notice: 'Compensation rate was successfully updated.' }
          format.json { render :show, status: :ok, location: @compensation_rate }
        else
          format.html { render :edit }
          format.json { render json: @compensation_rate.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /compensation_rates/1
    # DELETE /compensation_rates/1.json
    def destroy
      @compensation_rate.destroy
      respond_to do |format|
        format.html { redirect_to compensation_rates_url, notice: 'Compensation rate was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_compensation_rate
        @compensation_rate = CompensationRate.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def compensation_rate_params
        params.fetch(:compensation_rate, {})
      end
  end
end
