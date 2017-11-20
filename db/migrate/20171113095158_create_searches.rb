class CreateSearches < ActiveRecord::Migration
 def up
    sql = <<-SQL
      CREATE VIEW searches AS
        SELECT 
          trees.name AS tree_name,
          trees.id AS tree_id,
          classifications.name AS classification_name,
          classifications.id AS classification_id,
          tariffs.name AS tariff_rate,
          tariffs.id AS tariff_id,
          material_volumes.diameter AS diameter, 
          material_volumes.large AS large, 
          material_volumes.mid AS mid, 
          material_volumes.small AS small,
          material_volumes.large + material_volumes.mid + material_volumes.small AS tech_sum, 
          material_volumes.combustible AS combustible, 
          material_volumes.umbrella AS umbrella, 
          material_volumes.garbage AS garbage,
          compensation_rates.large_price AS large_price,
          compensation_rates.mid_price AS mid_price,
          compensation_rates.small_price AS small_price,
          compensation_rates.combustible_price AS combustible_price,
          compensation_rates.garbage_price AS garbage_price,
          compensation_rates.umbrella_price AS umbrella_price,
          compensation_rates.large_price * material_volumes.large AS material_large, 
          compensation_rates.mid_price * material_volumes.mid AS material_mid, 
          compensation_rates.small_price * material_volumes.small AS material_small, 
          compensation_rates.combustible_price * material_volumes.combustible AS material_combustible, 
          compensation_rates.garbage_price * material_volumes.garbage AS material_garbage, 
          compensation_rates.umbrella_price * material_volumes.umbrella AS material_umbrella 
        FROM material_volumes 
        JOIN trees 
          ON material_volumes.tree_id = trees.id 
        JOIN classifications 
          ON material_volumes.classification_id = classifications.id 
        JOIN compensation_rates 
          ON compensation_rates.tree_id = trees.id 
        JOIN tariffs 
          ON compensation_rates.tariff_id = tariffs.id
    SQL

    execute(sql)
  end

  def down
    execute('DROP VIEW searches')
  end
end
