class Project < ActiveRecord::Base
  include UsefullScopes

  attr_accessible :preview, :title, :position

  mount_uploader :preview, PhotoUploader

  translates :title

  has_many :photos, :class_name => 'Project::Photo', :order => 'position ASC'


  validates_associated :photos
  attr_accessible :photos_attributes
  accepts_nested_attributes_for :photos, allow_destroy: true, reject_if: :all_blank
end
