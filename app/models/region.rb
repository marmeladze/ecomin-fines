class Region < ActiveRecord::Base
  has_many :forestries

  def self.having_forestries
    uniq.joins(:forestries).pluck(:name, :id)
  end
end
