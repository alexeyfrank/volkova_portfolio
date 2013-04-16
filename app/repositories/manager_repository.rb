module ManagerRepository
  extend ActiveSupport::Concern
  include UsefullScopes

  included do
    scope :active, -> { where state: :active }
    scope :inactive, -> { where state: :inactive }

    scope :web, -> { asc_by_full_name.active }
    scope :admin, -> { by_created_at }
  end
end