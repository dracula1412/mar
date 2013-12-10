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
    if (@car.class != Car::Worker) || @car.working?
      flash = "This car can't go to work"
    else
      flash = @car.working!(params[:time].to_i)[1]
    end
    redirect_to car_path(@car), notice: flash
  end

  def speed_up_worker
    now = Time.now
    if (@car.class != Car::Worker) || !@car.working? || !@car.enough_doraemon?
      flash = if !@car.enough_doraemon?
                "Not enough doraemon"
              else
                "Can not speed up"
              end
    else
      flash = @car.speed_up![1]
    end
    redirect_to car_path(@car), notice: flash
  end

  def race
    map = MiniMap.find(session[:map_id])
    now = Time.now
    session.delete(:map_id)
    if (@car.class == Car::Worker) || @car.working?
      flash = "Can not go to race"
    else
      flash = @car.race!(map)[1]
    end
    redirect_to map_path(map), notice: flash
  end

  private
  def get_car
    @car = Car.find(params[:id])
  end
end
