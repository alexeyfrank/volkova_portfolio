class Web::ProjectsController < Web::ApplicationController
  def index
    @projects = Project.asc_by_position
  end

  def show
    @project = Project.find params[:id]
  end
end
