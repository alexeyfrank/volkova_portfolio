class Photo < ActiveRecord::Base

  attr_accessible :file, :title

  mount_uploader :file,  PhotoUploader
end
