# frozen_string_literal: true

FactoryBot.define do
  factory :vehicle do
    name { Faker::Vehicle.unique.make_and_model }
    plate { 'ABC-1234' }
    brand { Faker::Vehicle.make }
    model { Faker::Vehicle.model }
    version { Faker::Vehicle.make_and_model }
    year { rand 1900..(1.year.from_now.year) }
    transmission { Transmission::AT }
    fuel { Fuel::GASOLINE }
    color { Faker::Vehicle.color }
    mileage { Faker::Vehicle.kilometrage }
    price { Faker::Number.decimal }

    store
  end
end
