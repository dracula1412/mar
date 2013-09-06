class AddGoldAndFuelAndDoraemonToUser < ActiveRecord::Migration
  def change
    add_column :users, :gold, :integer, :default => 10000
    add_column :users, :fuel, :integer, :default => 1000
    add_column :users, :doraemon, :integer, :default => 50
  end
end
