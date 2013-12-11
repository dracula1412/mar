class CreateBattles < ActiveRecord::Migration
  def up
    create_table :battles do |t|
      t.integer :car_id
      t.integer :map_id
      t.integer :gold

      t.timestamps
    end
  end
end
