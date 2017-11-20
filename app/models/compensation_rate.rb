class CompensationRate < ActiveRecord::Base
  belongs_to :tariff
  belongs_to :tree
end
