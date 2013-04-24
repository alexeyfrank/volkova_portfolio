class Biography < ActiveRecord::Base
  attr_accessible :content, :photo, :reviews_attributes

  mount_uploader :photo, PhotoUploader

  has_many :reviews, class_name: 'Biography::Review'

  validates_associated :reviews

  accepts_nested_attributes_for :reviews, allow_destroy: true, reject_if: :all_blank

  translates :content

  def self.biography
    Biography.first
  end
end
