# frozen_string_literal: true

FactoryBot.define do
  factory :store do
    name { Faker::Name.unique.name }

    address
  end
end
