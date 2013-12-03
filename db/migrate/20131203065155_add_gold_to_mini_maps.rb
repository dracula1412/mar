class AddGoldToMiniMaps < ActiveRecord::Migration
  def change
    add_column :mini_maps, :gold, :integer
  end
end
