class Photo < ActiveRecord::Base

  include UsefullScopes

  attr_accessible :file, :title, :position

  mount_uploader :file,  PhotoUploader

  include Rails.application.routes.url_helpers

  translates :title

  def to_jq_upload
    {
        "name" => title,
        "size" => 0,
        "url" => file_url,
        "delete_url" => admin_photo_path(:ru, self.id),
        "delete_type" => "DELETE"
    }
  end
end
