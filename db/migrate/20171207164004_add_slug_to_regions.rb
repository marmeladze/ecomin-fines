class AddSlugToRegions < ActiveRecord::Migration
  def change
    add_column :regions, :slug, :string, unique: true
  end
end
