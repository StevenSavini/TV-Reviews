require 'fog/aws'

class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  if Rails.env.test?
    storage :file
  else
    storage :fog
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :large do
    process resize_to_limit: [800, 800]
  end

  version :medium, from_version: :large do
    process resize_to_limit: [500, 500]
  end

  version :thumb do
    process resize_to_fit: [100, 100]
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def content_type_whitelist
    /image\//
  end
end
