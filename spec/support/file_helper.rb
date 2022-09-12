# frozen_string_literal: true

module FileHelper
  module_function

  def attach_image_data(image_path, image_name = 'image.png')
    attacher = Shrine::Attacher.new
    attacher.set(upload_image(image_path, image_name))

    attacher.column_data
  end

  def upload_image(image_path, image_name)
    image_full_path = File.join(Dir.pwd, image_path)
    file = File.open(image_full_path, binmode: true)
    uploaded_file = Shrine.upload(file, :cache, metadata: false)
    uploaded_file.metadata.merge!(
      'size' => File.size(file.path),
      'mime_type' => 'image/png',
      'filename' => image_name
    )

    uploaded_file
  end
end
