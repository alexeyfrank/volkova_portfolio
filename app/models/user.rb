class User < ActiveRecord::Base
  include UserRepository

  has_secure_password
  attr_accessible :email, :password

  validates :email, presence: true, email: true, length: { maximum: 255 }
  validates :password, length: { maximum: 255 }

  state_machine initial: :inactive do
    state :inactive
    state :active

    event :activate do
      transition :inactive => :active
    end

    event :deactivate do
      transition :active => :inactive
    end
  end

  def to_s
    email
  end
end
