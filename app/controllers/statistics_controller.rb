class StatisticsController < ApplicationController

  def index
  	@regional = Report
	  			.joins(:region)
	  			.group("regions.name")
	  			.sum("material_large_volume+material_mid_volume+garbage_volume+umbrella_volume+combustible_volume")
	
	@trees = Report
	  			.joins(:tree)
	  			.group("trees.name")
	  			.sum("material_large_volume+material_mid_volume+garbage_volume+umbrella_volume+combustible_volume")
	
	@this_month = Report
				.group_by_day_of_month(:created_at)
				.sum("material_large_volume+material_mid_volume+garbage_volume+umbrella_volume+combustible_volume")
  end

  def show
  end
end
