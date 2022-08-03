# frozen_string_literal: true

FactoryBot.define do
  factory :store do
    name { Faker::FunnyName.name }

    cep  { Faker::Address.zip }
    country { Faker::Address.country_code }
    state { Faker::Address.state }
    city { Faker::Address.city }
    district { Faker::Address.community }
    street  { Faker::Address.street_name }
    number  { Faker::Address.building_number }
    complement { Faker::Address.secondary_address }
  end
end
