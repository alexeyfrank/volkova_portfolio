class Web::Admin::UserEditType < User
  include BaseType

  attr_accessible :state_event, :password_confirmation

  validates :password, presence: true, confirmation: true, on: :create
end