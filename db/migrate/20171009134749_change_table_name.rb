class ChangeTableName < ActiveRecord::Migration
  def change
    rename_table :compenstation_rates, :compensation_rates
  end
end
