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
      notice = "This car can't go to work"
    else
      @car.started_at = now
      @car.ended_at = now + Settings.time_to_work.minutes
      if @car.save!
        notice = "This car is going to work !!"
        user = @car.user.increment!(:fuel,Settings.default_fuel)
      else
        notice = "This car can't go to work"
      end
    end
    redirect_to car_path(@car), notice: notice
  end

  private
  def get_car
    @car = Car.find(params[:id])
  end
end
