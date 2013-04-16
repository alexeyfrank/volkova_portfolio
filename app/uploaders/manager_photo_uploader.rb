# encoding: utf-8

class ManagerPhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "system/uploads/managers/#{mounted_as}/#{model.id}"
  end

  # Process files as they are uploaded:
  process :resize_to_fill => [200, 235]

  def extension_white_list
     %w(jpg jpeg gif png)
  end
end
