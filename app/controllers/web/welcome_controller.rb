class Web::WelcomeController < Web::ApplicationController
  def index
    @page = Page.find_by_slug! :main
  end
end
