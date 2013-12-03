class Car::Normal < Car
  def race!(map)
    # TODO: need transaction
    now = Time.now
    started_at = now
    ended_at = now + Settings.time_to_race.minutes
    if self.update_attribute(:ended_at, ended_at) 
      user.increment!(:gold, map.gold)
      user.decrement!(:fuel, Settings.default_race_cost)
      [true,"This car is racing, now  !!"]
    else
      [false,"This car can't go to racing"]
    end
  end
end
