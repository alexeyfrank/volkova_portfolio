class MainPage < ActiveRecord::Base
  attr_accessible :content, :first_photo, :second_photo, :third_photo

  mount_uploader :first_photo, PhotoUploader
  mount_uploader :second_photo, PhotoUploader
  mount_uploader :third_photo, PhotoUploader

  def self.page
    MainPage.first
  end
end
