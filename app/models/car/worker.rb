class Car::Worker < Car
  def working!
    # TODO: need transaction
    now = Time.now
    started_at = now
    ended_at = now + Settings.time_to_work.minutes
    if self.update_attribute(:ended_at, ended_at) 
      user.increment!(:fuel,Settings.default_fuel)
      [true,"This car is going to work !!"]
    else
      [false,"This car can't go to work"]
    end
  end

  def enough_doraemon?
    user.doraemon > Settings.default_speed_up
  end

  def speed_up!
    # TODO: need transaction
    if self.update_attribute(:ended_at, Time.now) 
      user.decrement!(:doraemon,Settings.default_speed_up)
      [true,"Speed up. This car'll become rest."]
    else
      [false,"Can not speed up"]
    end
  end
end
