class MaterialVolume < ActiveRecord::Base
  belongs_to :classification
  belongs_to :tree
end
