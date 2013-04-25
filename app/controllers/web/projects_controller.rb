class Web::ProjectsController < Web::ApplicationController
  def index
    @projects = Project.by_created_at
  end
end
