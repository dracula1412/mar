class CreateMasterWays < ActiveRecord::Migration
  def change
    create_table :master_ways do |t|
      t.string :title
      t.string :description
      t.integer :speed_up
      t.integer :speed_bonus

      t.timestamps
    end
  end
end
