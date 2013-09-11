class CreateCars < ActiveRecord::Migration
  def change 
    create_table :cars do |t|
      t.integer :user_id
      t.string :type
      t.datetime :started_at
      t.datetime :ended_at

      t.timestamps
    end
  end
end
