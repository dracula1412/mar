class MiniMap < ActiveRecord::Base
  attr_accessible :name, :description, :required

  has_many :ways
end
