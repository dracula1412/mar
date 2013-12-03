class Car < ActiveRecord::Base
  attr_accessible :user, :user_id, :started_at, :ended_at

  belongs_to :user

  def working?
    ended_at.nil? ? false : (ended_at > Time.now)
  end
end
