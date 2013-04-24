class Web::Admin::BiographiesController < Web::Admin::ApplicationController
  def edit
    @bio = Biography.biography
  end

  def update
    @bio = Biography.biography
    if @bio.update_attributes params[:biography]
      flash_success
      redirect_to edit_admin_biography_path
    else
      flash_error
      render :new
    end
  end
end
