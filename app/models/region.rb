class Region < ActiveRecord::Base
  has_many :forestries
  has_many :reports
  
  def self.having_forestries
    uniq.joins(:forestries).pluck(:name, :id)
  end
end
