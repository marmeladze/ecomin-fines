class Region < ActiveRecord::Base
  has_many :forestries
  has_many :reports

  after_save :update_slug
 
  def self.having_forestries
    uniq.joins(:forestries).pluck(:name, :id)
  end

  def self.having_reports
    uniq.joins(:reports)
  end

  def update_slug
    self.update_column(:slug, self.name.gsub('ə', 'e').parameterize)
  end

end
