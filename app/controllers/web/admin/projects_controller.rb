class Web::Admin::ProjectsController < Web::Admin::ApplicationController
  def index
    @search = Project.ransack params[:q]
    @projects = @search.result.page(params[:page]).per(20)
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new params[:project]
    if @project.save
      flash_success
      redirect_to edit_admin_project_path(@project)
    else
      flash_error
      render :new
    end
  end

  def edit
    @project = Project.find params[:id]
  end

  def update
    @project = Project.find params[:id]
    if @project.update_attributes params[:project]
      flash_success
      redirect_to edit_admin_project_path(@project)
    else
      flash_error
      render :edit
    end
  end

  def destroy
    @project = Project.find params[:id]
    @project.destroy
    redirect_to admin_projects_path
  end
end
