class AddDetourToQuarters < ActiveRecord::Migration
  def change
    add_reference :quarters, :detour, index: true, foreign_key: true
  end
end
