class Web::Admin::UsersController < Web::Admin::ApplicationController
  def index
    @search = User.ransack params[:q]
    @users = @search.result.admin.page(params[:page]).per(20)
  end

  def new
    @user = ::Web::Admin::UserEditType.new
  end

  def create
    @user = ::Web::Admin::UserEditType.new params[:user]
    if @user.save
      flash_success
      redirect_to edit_admin_user_path(@user)
    else
      flash_error
      render :new
    end
  end

  def edit
    @user = ::Web::Admin::UserEditType.find params[:id]
  end

  def update
    @user = ::Web::Admin::UserEditType.find params[:id]
    if @user.update_attributes params[:user]
      flash_success
      redirect_to edit_admin_user_path(@user)
    else
      flash_error
      render :edit
    end
  end

  def destroy
    @user = ::Web::Admin::UserEditType.find params[:id]
    @user.destroy
    flash_success
    redirect_to admin_users_path
  end
end
