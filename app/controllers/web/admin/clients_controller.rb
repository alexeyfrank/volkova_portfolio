class Web::Admin::ClientsController < Web::Admin::ApplicationController
  def index
    @search = Client.ransack params[:q]
    @clients = @search.result.admin.page(params[:page]).per(20)
  end

  def new
    @client = Client.new
  end

  def edit
    @client = Client.find params[:id]
  end

  def create
    @client = Client.new params[:client]
    if @client.save
      flash_success
      redirect_to edit_admin_client_path(@client)
    else
      flash_error
      render :new
    end
  end

  def update
    @client = Client.find params[:id]
    if @client.update_attributes params[:client]
      flash_success
      redirect_to edit_admin_client_path(@client)
    else
      flash_error
      render :edit
    end
  end

  def destroy
    @client = Client.find params[:id]
    @client.destroy
    flash_success
    redirect_to admin_clients_path
  end
end
