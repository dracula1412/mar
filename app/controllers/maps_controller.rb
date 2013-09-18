class MapsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @maps = MiniMap.where("required <= #{current_user.level}").order(:required)
  end

  def show
    @map = MiniMap.find(params[:id])
    @ways = @map.ways
    @cars = current_user.normal_cars
  end
end
