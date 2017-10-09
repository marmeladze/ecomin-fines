class CreateMaterialVolumes < ActiveRecord::Migration
  def change
    create_table :material_volumes do |t|
      t.references :classification, index: true, foreign_key: true
      t.references :tree, index: true, foreign_key: true
      t.integer :diameter
      t.decimal :large, precision: 5, scale: 3, default: 0.000
      t.decimal :mid, precision: 5, scale: 3, default: 0.000
      t.decimal :small, precision: 5, scale: 3, default: 0.000
      t.decimal :combustible, precision: 5, scale: 3, default: 0.000
      t.decimal :garbage, precision: 5, scale: 3, default: 0.000
      t.decimal :umbrella, precision: 5, scale: 3, default: 0.000

      t.timestamps null: false
    end
  end
end
