# frozen_string_literal: true

class ImageUploader < Shrine
  plugin :validation_helpers

  Attacher.validate do
    validate_max_size  5 * 1024 * 1024, message: ->(max) { [:too_large, { max: }] }
    validate_mime_type %w[image/png image/jpeg image/jpg], message: ->(_) { [:not_image] }
    validate_extension %w[png jpeg jpg], message: ->(_) { [:not_image] }
  end
end
