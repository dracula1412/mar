class FuelCollection < ActiveRecord::Base
  attr_accessible :car, :car_id, :time_to_go, :fuel

  belongs_to :car
end
