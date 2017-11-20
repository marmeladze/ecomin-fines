class CreateTariffs < ActiveRecord::Migration
  def change
    create_table :tariffs do |t|
      t.string :name
      t.numrange :distance

      t.timestamps null: false
    end
    Tariff.create name: "I dərəcə", distance: 0..10
    Tariff.create name: "II dərəcə", distance: 10.1..25
    Tariff.create name: "III dərəcə", distance: 25.1..40     
  end
end
