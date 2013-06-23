class Web::Admin::Projects::ApplicationController < Web::Admin::ApplicationController

  def resource_project
    Project.find params[:project_id]
  end

  helper_method :resource_project
end
