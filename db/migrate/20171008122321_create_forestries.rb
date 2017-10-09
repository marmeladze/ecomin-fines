class CreateForestries < ActiveRecord::Migration
  def change
    create_table :forestries do |t|
      t.string :name
      t.text :description
      t.references :region, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
