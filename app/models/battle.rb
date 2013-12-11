class Battle < ActiveRecord::Base
  attr_accessible :car, :car_id, :map, :map_id, :gold

  belongs_to :car
  belongs_to :map, :class_name => "MiniMap"
end

