class AddGoldAndDoraemonToUserLevels < ActiveRecord::Migration
  def change
    add_column :user_levels, :gold, :integer
    add_column :user_levels, :doraemon, :integer
  end
end
