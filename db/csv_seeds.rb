require 'csv'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
tree_id = 5
path =  Rails.root.join('public', 'sheets', 'azat_agaci_height_ranges.csv')
rows = CSV.open(path, headers: false).as_json[1..-1]
rows.each do |row|
  dia, ranges = row.partition { |e| e == row.first }
  dia = dia[0].to_i
  ranges = ranges.map { |e| e.to_range if e.present? }
  ranges.each do |range|
     h = {tree_id: tree_id, classification_id: ranges.index(range)+1, diameter: dia, h_range: range }
     HeightRange.create! h
  end
end

qath = Rails.root.join('public', 'sheets', 'azat_agaci_III_classification.csv')
data = CSV.open(qath, headers: true).as_json 
hashes = data.map {|e| e.to_h }.map {|f| f.transform_values! { |g| g.to_f } }
hashes.each do |dict|
  dict.merge!({tree_id: tree_id, classification_id: 3})
  MaterialVolume.create! dict
end
