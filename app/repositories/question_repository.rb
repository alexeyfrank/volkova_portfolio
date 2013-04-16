module QuestionRepository
  extend ActiveSupport::Concern
  include UsefullScopes

  included do
    scope :web, -> {by_created_at}
    scope :admin, -> {by_created_at}
  end
end