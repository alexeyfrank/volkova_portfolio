class Web::PhotosController < Web::ApplicationController
  def index
    @photos = Photo.asc_by_position
  end
end
