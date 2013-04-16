class Page < ActiveRecord::Base
  include PageRepository

  attr_accessible :content, :slug, :title
  validates :title, presence: true, length: { maximum: 255 }
  validates :slug, presence: true, slug: true, length: { maximum: 255 }

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
    title
  end

  def to_param
    slug
  end
end
