class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.references :tree, index: true, foreign_key: true
      t.references :classification, index: true, foreign_key: true
      t.references :region, index: true, foreign_key: true
      t.references :forestry, index: true, foreign_key: true
      t.references :detour, index: true, foreign_key: true
      t.references :quarter, index: true, foreign_key: true
      t.references :tariff, index: true, foreign_key: true
      t.integer :diameter
      t.integer :material_count
      t.integer :semi_material_count
      t.integer :combustible_count
      t.decimal :material_large_volume, precision: 5, scale: 3, default: 0.00
      t.decimal :material_mid_volume, precision: 5, scale: 3, default: 0.00
      t.decimal :material_small_volume, precision: 5, scale: 3, default: 0.00
      t.decimal :combustible_volume, precision: 5, scale: 3, default: 0.00
      t.decimal :garbage_volume, precision: 5, scale: 3, default: 0.00
      t.decimal :umbrella_volume, precision: 5, scale: 3, default: 0.00
      t.decimal :material_large_price, precision: 5, scale: 2, default: 0.00
      t.decimal :material_mid_price, precision: 5, scale: 2, default: 0.00
      t.decimal :material_small_price, precision: 5, scale: 3, default: 0.00
      t.decimal :combustible_price, precision: 5, scale: 3, default: 0.00
      t.decimal :garbage_price, precision: 5, scale: 3, default: 0.00
      t.decimal :umbrella_price, precision: 5, scale: 3, default: 0.00
      t.references :user, index: true, foreign_key: true
      t.string :verbatim, unique: true

      t.timestamps null: false
    end
  end
end
