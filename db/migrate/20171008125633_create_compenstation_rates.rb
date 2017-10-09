class CreateCompenstationRates < ActiveRecord::Migration
  def change
    create_table :compenstation_rates do |t|
      t.references :classification, index: true, foreign_key: true
      t.references :tree, index: true, foreign_key: true
      t.decimal :large_price, precision: 5, scale: 2, default: 0.00
      t.decimal :mid_price, precision: 5, scale: 2, default: 0.00
      t.decimal :small_price, precision: 5, scale: 2, default: 0.00
      t.decimal :combustible_price, precision: 5, scale: 2, default: 0.00
      t.decimal :garbage_price, precision: 5, scale: 2, default: 0.00
      t.decimal :umbrella_price, precision: 5, scale: 2, default: 0.00

      t.timestamps null: false
    end
  end
end
