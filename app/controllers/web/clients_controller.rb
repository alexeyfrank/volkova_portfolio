class Web::ClientsController < Web::ApplicationController
  def index
    @clients = Client.web
  end

  def show
    @client = Client.includes(:images).find params[:id]
  end
end
