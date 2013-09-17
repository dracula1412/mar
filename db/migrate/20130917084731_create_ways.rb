class CreateWays < ActiveRecord::Migration
  def change 
    create_table :ways do |t|
      t.integer :mini_map_id
      t.integer :master_way_id
      t.integer :distance

      t.timestamps
    end
  end
end
