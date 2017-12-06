class Report < ActiveRecord::Base
  belongs_to :tree
  belongs_to :classification
  belongs_to :region
  belongs_to :forestry
  belongs_to :detour
  belongs_to :quarter
  belongs_to :tariff
  belongs_to :user  

  scope :by_user, -> (user_id) { where(user_id: user_id) }
  scope :by_tree, -> (tree_id) { where(tree_id: tree_id) }
  scope :by_region, -> (region_id) { where(region_id: region_id) }
  scope :by_forestry, -> (forestry_id) { where(forestry_id: forestry_id) }

end
