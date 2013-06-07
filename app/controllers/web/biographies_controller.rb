class Web::BiographiesController < Web::ApplicationController
  def show
    @bio = Biography.biography
  end
end
