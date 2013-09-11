class CarsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @worker_cars = current_user.worker_cars
    @normal_cars = current_user.normal_cars
    @special_cars = current_user.special_cars
  end

  def show
    @car = Car.find(params[:id])
  end
end
