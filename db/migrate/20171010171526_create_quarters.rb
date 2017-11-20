class CreateQuarters < ActiveRecord::Migration
  def change
    create_table :quarters do |t|
      t.string :name
      t.string :lat
      t.string :lng

      t.timestamps null: false
    end
  end
end
