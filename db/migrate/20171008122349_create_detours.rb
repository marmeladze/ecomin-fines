class CreateDetours < ActiveRecord::Migration
  def change
    create_table :detours do |t|
      t.string :name
      t.text :description
      t.references :forestry, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
