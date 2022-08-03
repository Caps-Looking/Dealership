# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    cep { Faker::Address.zip }
    state { Faker::Address.state }
    city { Faker::Address.city }
    district { Faker::Address.community }
    street  { Faker::Address.street_name }
    number  { Faker::Address.building_number }
    complement { Faker::Address.secondary_address }
  end
end
