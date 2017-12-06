class Report < ActiveRecord::Base
  belongs_to :tree
  belongs_to :classification
  belongs_to :region
  belongs_to :forestry
  belongs_to :detour
  belongs_to :quarter
  belongs_to :tariff
  belongs_to :user
end
