class Client::Image < ActiveRecord::Base
  attr_accessible :image, :title, :client_id

  belongs_to :client

  mount_uploader :image, ClientImageImageUploader

  validates :title, presence: true
end
