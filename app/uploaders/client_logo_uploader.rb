# encoding: utf-8

class ClientLogoUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    "system/uploads/clients/#{mounted_as}/#{model.id}"
  end
end
