class Client < ActiveRecord::Base
  include ClientRepository

  attr_accessible :name, :site, :images_attributes, :state_event, :logo

  mount_uploader :logo, ClientLogoUploader

  has_many :images, class_name: 'Client::Image'

  validates :name, presence: true
  validates_associated :images
  accepts_nested_attributes_for :images, allow_destroy: true, reject_if: :all_blank


  state_machine initial: :inactive do
    state :inactive
    state :active
    state :trashed

    event :activate do
      transition [:inactive, :trashed] => :active
    end

    event :deactivate do
      transition [:active, :trashed] => :inactive
    end

    event :trash do
      transition [:active, :inactive] => :trashed
    end
  end

  def to_s
    name
  end

end
