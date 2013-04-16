class Web::Admin::WelcomeController < Web::Admin::ApplicationController
  def index
    @questions = Question.admin.limit(5)
    @users = User.admin.limit(5)
    @pages = Page.admin.limit(5)
  end
end
