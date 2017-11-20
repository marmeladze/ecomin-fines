require 'csv'

class HeightRange < ActiveRecord::Base
  belongs_to :classification
  belongs_to :tree

  def range_bounds
    HeightRange.select("lower(h_range) as low, upper(h_range) as up").where(id: id).first
  end

  def upper
    range_bounds.up.to_f
  end

  def lower
    range_bounds.low.to_f
  end

end
