class Question < ActiveRecord::Base
  include QuestionRepository

  attr_accessible :content, :email, :full_name, :phone

  validates :full_name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, length: { maximum: 255 }, email: true
  validates :phone, presence: true, length: { maximum: 255 }
  validates :content, presence: true

  def to_s
    full_name
  end
end
