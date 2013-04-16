class Web::ContactsController < Web::ApplicationController
  def index
    @managers = Manager.web
  end
end
