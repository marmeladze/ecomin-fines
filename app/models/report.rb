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

  def material_factor
    (material_count + semi_material_count*0.50)
  end

  def technical_material_counts_sum
    material_count + semi_material_count + combustible_count
  end

  def total_material_parts_volume
    material_large_volume + material_mid_volume + material_small_volume
  end

  def total_non_material_parts_volume
    combustible_volume + garbage_volume + umbrella_volume
  end

  def overall_volume
    total_material_parts_volume + total_non_material_parts_volume
  end

end
