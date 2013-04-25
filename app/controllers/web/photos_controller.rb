class Web::PhotosController < Web::ApplicationController
  def index
    @photos = Project::Photo.by_created_at
  end
end
