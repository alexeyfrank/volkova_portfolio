class Web::Admin::PhotosController < Web::Admin::ApplicationController
  def index
    @search = Photo.ransack params[:q]
    @photos = @search.result.asc_by_position.page(params[:page]).per(20)
    respond_to do |format|
      format.html
      format.json { render json: Photo.all.map{|upload| upload.to_jq_upload } }
    end
  end

  def show
    @upload = Photo.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @upload }
    end
  end

  def new
    @photo = Photo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @photo }
    end
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def create
    @photo = Photo.new(params[:photo])
    @photo.title = params[:photo][:file].original_filename.split('.')[0]

    respond_to do |format|
      if @photo.save
        format.html {
          render :json => [@photo.to_jq_upload].to_json,
                 :content_type => 'text/html',
                 :layout => false
        }
        format.json { render json: {files: [@photo.to_jq_upload]}, status: :created }
      else
        format.html { render action: "new" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @photo = Photo.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        flash_success
        format.html { redirect_to edit_admin_photo_path(@photo), notice: 'Upload was successfully updated.' }
        format.json { head :no_content }
      else
        flash_error
        format.html { render action: "edit" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to admin_photos_url }
      format.json { head :no_content }
    end
  end
end
