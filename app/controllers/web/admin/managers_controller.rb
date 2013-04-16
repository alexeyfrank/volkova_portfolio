class Web::Admin::ManagersController < Web::Admin::ApplicationController
  def index
    @search = Manager.ransack params[:q]
    @managers = @search.result.admin.page(params[:page]).per(20)
  end

  def new
    @manager = ::Web::Admin::ManagerEditType.new
  end

  def edit
    @manager = ::Web::Admin::ManagerEditType.find params[:id]
  end

  def create
    @manager = ::Web::Admin::ManagerEditType.new params[:manager]
    if @manager.save
      flash_success
      redirect_to edit_admin_manager_path(@manager)
    else
      flash_error
      render :new
    end
  end

  def update
    @manager = ::Web::Admin::ManagerEditType.find params[:id]
    if @manager.update_attributes params[:manager]
      flash_success
      redirect_to edit_admin_manager_path(@manager)
    else
      flash_error
      render :edit
    end
  end

  def destroy
    @manager = Manager.find params[:id]
    @manager.destroy
    flash_success
    redirect_to admin_managers_path
  end

end
