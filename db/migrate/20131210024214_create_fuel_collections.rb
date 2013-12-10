class CreateFuelCollections < ActiveRecord::Migration
  def change 
    create_table :fuel_collections do |t|
      t.integer :car_id
      t.integer :time_to_go
      t.integer :fuel

      t.timestamps
    end
  end
end
