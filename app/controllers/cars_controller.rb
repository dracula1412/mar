class CarsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_car, :except => [:index]

  def index
    @worker_cars = current_user.worker_cars
    @normal_cars = current_user.normal_cars
    @special_cars = current_user.special_cars
  end

  def show
  end

  def go_to_work
    now = Time.now
    if (@car.class != Car::Worker) || (@car.ended_at && @car.ended_at > now)
      flash = "This car can't go to work"
    else
      @car.started_at = now
      @car.ended_at = now + Settings.time_to_work.minutes
      if @car.save!
        flash = "This car is going to work !!"
        @car.user.increment!(:fuel,Settings.default_fuel)
      else
        flash = "This car can't go to work"
      end
    end
    redirect_to car_path(@car), notice: flash
  end

  def speed_up_worker
    now = Time.now
    if (@car.class != Car::Worker) || (@car.ended_at && @car.ended_at < now) || (@car.user.doraemon < Settings.default_speed_up)
      flash = "Can not speed up"
    else
      @car.ended_at = now
      if @car.save!
        flash = "Speed up. This car'll become rest."
        @car.user.decrement!(:doraemon,Settings.default_speed_up)
      else
        flash = "Can not speed up"
      end
    end
    redirect_to car_path(@car), notice: flash
  end

  def race
    map = MiniMap.find(params[:map_id])
    now = Time.now
    if (@car.class == Car::Worker) || (@car.ended_at && @car.ended_at > now)
      flash = "Can not go to race"
    else
      # TODO: make spec for racing
      flash = "The car is racing now"
    end
    redirect_to map_path(map), notice: flash
  end

  private
  def get_car
    @car = Car.find(params[:id])
  end
end
