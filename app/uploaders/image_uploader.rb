# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  # uses RMagick for image manipulation
  include CarrierWave::RMagick

  # store locally on teh server
  storage :file

  # store in the uploads directory
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # create a thumbnail and full sized versions each time someone saves an image
  version :thumb do
    process :resize_to_fill => [75, 50]
  end

  version :full_size do
    process :resize_to_fill => [900, 600]
  end

end
