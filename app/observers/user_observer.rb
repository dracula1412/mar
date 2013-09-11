class UserObserver < ActiveRecord::Observer
  def after_create(user)
    user.worker_cars.create
    user.normal_cars.create
  end
end
