class Quarter < ActiveRecord::Base
  belongs_to :detour

  scope :with_all_parents, ->  { 
    select(
      "quarters.id AS id, CONCAT(regions.name, ' / ', forestries.name, ' / ', detours.name, ' / ', quarters.name) AS parent, quarters.lat AS lat, quarters.lng AS lng"
    ).joins(detour: [forestry: :region]) 
  }

  def name_on_report
    name.match(/\d+/)
  end

end
