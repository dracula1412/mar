class Car::Normal < Car
  def race!
    # TODO: need transaction
    now = Time.now
    started_at = now
    ended_at = now + Settings.time_to_work.minutes
    if self.update_attribute(:ended_at, ended_at) 
      user.increment!(:gold,Settings.default_fuel)
      [true,"This car is racing, now  !!"]
    else
      [false,"This car can't go to racing"]
    end
  end
end
