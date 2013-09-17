class Way < ActiveRecord::Base
  attr_accessible :mini_map_id, :mini_map, :master_way_id, :master_way, :distance

  belongs_to :mini_map
  belongs_to :master_way
end
