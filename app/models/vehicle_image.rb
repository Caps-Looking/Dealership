# frozen_string_literal: true

class VehicleImage < ApplicationRecord
  include ImageUploader::Attachment(:image)
  belongs_to :vehicle

  validates :image, presence: true
end
