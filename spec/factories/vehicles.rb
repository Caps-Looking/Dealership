# frozen_string_literal: true

FactoryBot.define do
  factory :vehicle do
    name { Faker::Vehicle.unique.make_and_model }
    plate { Faker::Vehicle.license_plate }
    brand { Faker::Vehicle.make }
    model { Faker::Vehicle.model }
    version { Faker::Vehicle.make_and_model }
    year { '97/97' }
    transmission { Transmission::AT }
    fuel { Fuel::GASOLINE }
    color { Faker::Vehicle.color }
    mileage { Faker::Vehicle.kilometrage }
    price { Faker::Number.decimal }

    store
  end
end
