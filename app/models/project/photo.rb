class Project::Photo < ActiveRecord::Base
  include UsefullScopes

  attr_accessible :image, :project_id, :title, :position

  mount_uploader :image, PhotoUploader

  belongs_to :project

  translates :title

  include Rails.application.routes.url_helpers

  def to_jq_upload
    {
        "name" => title,
        "size" => 0,
        "url" => image_url,
        "delete_url" => admin_project_project_photo_path(:ru, self.project_id, self.id),
        "delete_type" => "DELETE"
    }
  end
end
