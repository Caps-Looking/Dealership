# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    cep { '12312-312' }
    state { Faker::Address.state }
    city { Faker::Address.city }
    district { Faker::Address.community }
    street  { Faker::Address.street_name }
    number  { rand 1..9_999_999 }
    complement { Faker::Address.secondary_address }
  end
end
