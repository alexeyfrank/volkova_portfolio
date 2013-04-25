class Project::Photo < ActiveRecord::Base
  include UsefullScopes
  attr_accessible :image, :project_id, :title

  mount_uploader :image, PhotoUploader

  belongs_to :project

  translates :title
end
