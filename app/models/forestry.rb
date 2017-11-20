class Forestry < ActiveRecord::Base
  belongs_to :region
  has_many :detours

  scope :with_region, -> {
    select("CONCAT(regions.name, ' / ', forestries.name) as parent, forestries.id as id")
    .joins(:region)
    .map {|e| [e.parent, e.id] }
  }   

end
