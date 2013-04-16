class Manager < ActiveRecord::Base
  include ManagerRepository

  attr_accessible :email, :phone, :full_name, :photo, :region

  validates :full_name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, length: { maximum: 255 }, email: true
  validates :phone, presence: true, length: { maximum: 255 }
  validates :region, presence: true, length: { maximum: 255 }

  mount_uploader :photo, ManagerPhotoUploader

  state_machine initial: :inactive do
    state :inactive
    state :active

    event :activate do
      transition [:inactive] => :active
    end

    event :deactivate do
      transition [:active] => :inactive
    end
  end

  def to_s
    full_name
  end

end
