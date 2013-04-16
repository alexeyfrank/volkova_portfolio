class Web::SessionsController < Web::ApplicationController

  layout 'web/sign_in'

  def new
    @type = Web::UserSignInType.new
  end

  def create
    @type = Web::UserSignInType.new params[:web_user_sign_in_type]
    if @type.valid?
      user = @type.user
      sign_in user
      flash_success
      redirect_to admin_root_path
    else
      flash_error
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
