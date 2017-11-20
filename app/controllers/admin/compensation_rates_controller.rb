module Admin
  class CompensationRatesController < BaseController
    before_action :set_compensation_rate, only: [:show, :edit, :update, :destroy]
    before_action :set_related, only: [:edit, :new]

    def index
      @compensation_rates = CompensationRate.all
    end


    def show
    end

    def new
      @compensation_rate = CompensationRate.new
    end

    def edit
    end


    def create
      @compensation_rate = CompensationRate.new(compensation_rate_params)

      if @compensation_rate.save
        redirect_to admin_compensation_rates_path, notice: 'Compensation rate was successfully created.'
      else
        render :new
      end

    end

    # PATCH/PUT /compensation_rates/1
    # PATCH/PUT /compensation_rates/1.json
    def update 

      if @compensation_rate.update(compensation_rate_params)
        redirect_to admin_compensation_rates_path(@compensation_rate), notice: 'Compensation rate was successfully updated.'
      else
        render :edit
      end

    end

    # DELETE /compensation_rates/1
    # DELETE /compensation_rates/1.json
    def destroy
      @compensation_rate.destroy
      redirect_to admin_compensation_rates_url, notice: 'Compensation rate was successfully destroyed.' 
    end

    private
    
    def set_related
      @tariffs = Tariff.pluck(:name, :id)
      @trees = Tree.pluck(:name, :id)
    end
    
    def set_compensation_rate
      @compensation_rate = CompensationRate.find(params[:id])
    end

    def compensation_rate_params
      params.require(:compensation_rate).permit(:tariff_id, :tree_id, :large_price, :mid_price, 
        :small_price, :combustible_price, :garbage_price, :umbrella_price)
    end
  end
end
