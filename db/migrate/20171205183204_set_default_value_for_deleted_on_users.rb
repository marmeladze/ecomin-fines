class SetDefaultValueForDeletedOnUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :deleted
  	add_column :users, :deleted, :boolean, default: false
  end
end
