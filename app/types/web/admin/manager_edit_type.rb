class Web::Admin::ManagerEditType < Manager
  include BaseType

  attr_accessible :state_event
end