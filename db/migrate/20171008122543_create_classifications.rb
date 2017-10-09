class CreateClassifications < ActiveRecord::Migration
  def change
    create_table :classifications do |t|
      t.string :name, unique: true
      t.text :description

      t.timestamps null: false
    end
  end
end
