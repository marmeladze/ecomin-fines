class Detour < ActiveRecord::Base
  belongs_to :forestry
  has_many :quarters
  has_many :reports
  def region_name
    self.forestry.region.name
  end

  def name_on_report
    name.match(/\d+/)
  end
end
