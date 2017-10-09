class CreateHeightRanges < ActiveRecord::Migration
  def change
    create_table :height_ranges do |t|
      t.references :classification, index: true, foreign_key: true
      t.references :tree, index: true, foreign_key: true
      t.numrange :h_range
      t.integer :diameter

      t.timestamps null: false
    end
  end
end
