module PageRepository
  extend ActiveSupport::Concern
  include UsefullScopes

  included do
    scope :active, -> { where state: :active }
    scope :inactive, -> { where state: :inactive }
    scope :trashed, -> { where state: :trashed }

    scope :web, -> { active.by_created_at }
    scope :admin, -> { by_created_at }
  end
end