class Search < ActiveRecord::Base
  scope :by_tree, -> (t_id) { where(tree_id: t_id) }
  scope :by_tariff, -> (t_id) { where(tariff_id: t_id) }
  scope :by_diameter, -> (dia) { where(diameter: dia) }
  scope :by_range, -> (rng) { where("h_range @> ?", rng.to_f) }
  scope :by_classification, -> (c_id) { where(classification_id: c_id) }

  MATERIALIZED = {
    material: 1,
    semi_material: 0.5,
    combustible: 0
  }


  def materials_hash
    as_json.slice(*(%w(large mid small combustible garbage umbrella))).transform_values(&:to_f)
  end

  def materials
    OpenStruct.new(materials_hash)
  end


  def volumes_with(material=1, semi_material=0, combustible=0)
  end

end
