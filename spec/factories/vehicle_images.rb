# frozen_string_literal: true

FactoryBot.define do
  factory :vehicle_image do
    image_data { FileHelper.attach_image_data('/spec/support/fixtures/pepe.png', 'pepe.png') }
  end
end
