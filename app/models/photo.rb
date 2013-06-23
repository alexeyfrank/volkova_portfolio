class Photo < ActiveRecord::Base

  include UsefullScopes

  attr_accessible :file, :title

  mount_uploader :file,  PhotoUploader

end
