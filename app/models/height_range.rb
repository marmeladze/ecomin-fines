class HeightRange < ActiveRecord::Base
  belongs_to :classification
  belongs_to :tree


  def unusual_update dict    
    HeightRange.where(id: id).update_all(attrs_to_sql_set_stmt(dict))    
  end

  def attrs_to_sql_set_stmt dct
    dct.map{|k,v| "#{k} = #{v}" }.join(", ")
  end

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
