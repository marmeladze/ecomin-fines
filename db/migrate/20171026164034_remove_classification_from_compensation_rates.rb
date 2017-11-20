class RemoveClassificationFromCompensationRates < ActiveRecord::Migration
  def change
    remove_reference :compensation_rates, :classification, index: true, foreign_key: true
    add_reference :compensation_rates, :tariff, index: true, foreign_key: true
  end
end
