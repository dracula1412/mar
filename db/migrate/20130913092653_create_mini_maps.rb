class CreateMiniMaps < ActiveRecord::Migration
  def change 
    create_table :mini_maps do |t|
      t.string :name
      t.string :description
      t.integer :required, :default => 1 

      t.timestamps
    end
  end
end
