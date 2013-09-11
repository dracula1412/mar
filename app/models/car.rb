class Car < ActiveRecord::Base
  attr_accessible :user, :user_id, :started_at, :ended_at

  belongs_to :user
end
