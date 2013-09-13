class CreateUserLevels < ActiveRecord::Migration
  def change 
    create_table :user_levels do |t|
      t.string :description

      t.timestamps
    end
  end
end
