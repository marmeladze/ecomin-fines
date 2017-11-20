class Detour < ActiveRecord::Base
  belongs_to :forestry
  has_many :quarters

  def region_name
    self.forestry.region.name
  end

  def name_on_report
    name.match(/\d+/)
  end
end
