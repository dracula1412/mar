class Car::Worker < Car
  has_many :fuel_collections, :foreign_key => :car_id
  def working!(time)
    # TODO: need transaction
    now = Time.now
    started_at = now
    ended_at = now + time.minutes
    fuel = Settings.time_to_work.send(time.to_s.to_sym)
    self.fuel_collections.create(time_to_go: time, fuel: fuel)
    if self.update_attribute(:ended_at, ended_at) 
      user.increment!(:fuel,fuel)
      [true,"This car is going to work !!"]
    else
      [false,"This car can't go to work"]
    end
  end

  def doraemon_require
    return 0 if ended_at.nil? or ended_at < Time.now
    ((ended_at - Time.now).to_i/1200 + 1)*Settings.default_speed_up
  end

  def enough_doraemon?
    user.doraemon > doraemon_require 
  end

  def speed_up!
    # TODO: need transaction
    return [false,"Not enough doraemon"] unless enough_doraemon?
    doraemon = doraemon_require
    if self.update_attribute(:ended_at, Time.now) 
      user.decrement!(:doraemon,doraemon)
      [true,"Speed up. This car'll become rest."]
    else
      [false,"Can not speed up"]
    end
  end
end
