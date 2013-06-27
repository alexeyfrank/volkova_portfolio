class Web::Admin::Projects::ProjectPhotosController < Web::Admin::Projects::ApplicationController
  def index
    @uploads = resource_project.photos
    @photo = resource_project.photos.build
    respond_to do |format|
      format.html
      format.json { render json: @uploads.map{|upload| upload.to_jq_upload } }
    end
  end

  def show
    @upload = Project::Photo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @upload }
    end
  end

  def new
    @upload = Project::Photo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @upload }
    end
  end

  def edit
    @upload = Project::Photo.find(params[:id])
  end

  def create
    p_attr = params[:project_photo]
    p_attr[:image] = params[:project_photo][:image].first if params[:project_photo][:image].class == Array


    @upload = Project::Photo.new(params[:project_photo])
    @upload.title = params[:project_photo][:image].original_filename.split('.')[0]

    respond_to do |format|
      if @upload.save
        format.html {
          render :json => [@upload.to_jq_upload].to_json,
                 :content_type => 'text/html',
                 :layout => false
        }
        format.json { render json: {files: [@upload.to_jq_upload]}, status: :created }
      else
        format.html { render action: "new" }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @upload = Project::Photo.find(params[:id])

    respond_to do |format|
      if @upload.update_attributes(params[:project_photo])
        format.html { redirect_to @upload, notice: 'Upload was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @upload = Project::Photo.find(params[:id])
    @upload.destroy

    respond_to do |format|
      format.html { redirect_to uploads_url }
      format.json { head :no_content }
    end
  end

end