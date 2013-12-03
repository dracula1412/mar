class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]

  # Validation
  validates :username, :uniqueness => { :case_sensitive => true }

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me

  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login
  attr_accessible :login

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  belongs_to :user_level, :foreign_key => "level", :class_name =>  "UserLevel"
  has_many :cars
  has_many :worker_cars, :class_name => 'Car::Worker'
  has_many :normal_cars, :class_name => 'Car::Normal'
  has_many :special_cars, :class_name => 'Car::Special'

  def level_up?
    next_level = UserLevel.find(level+1)
    (gold > next_level.gold) && (doraemon > next_level.doraemon)
  end

  def level_up!
    return "Not enough resource to level up" unless level_up?
    return "Sorry, you are max level." if level >= Settings.level_max
    next_level = UserLevel.find(level+1)
    if self.decrement!(:gold, next_level.gold) and self.decrement!(:doraemon, next_level.doraemon) and self.increment!(:level)
      'Congratulation, Level Up !!'
    else
      'Error !!'
    end
  end
end
