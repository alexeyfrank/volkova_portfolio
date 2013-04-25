class Web::Admin::MainPagesController < Web::Admin::ApplicationController
  def edit
    @page = MainPage.page
  end

  def update
    @page = MainPage.page
    if @page.update_attributes params[:main_page]
      flash_success
      redirect_to edit_admin_main_page_path
    else
      flash_error
      render :edit
    end
  end
end
