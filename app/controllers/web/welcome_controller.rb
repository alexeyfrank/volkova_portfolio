class Web::WelcomeController < Web::ApplicationController
  def index
    @page = MainPage.page
  end
end
