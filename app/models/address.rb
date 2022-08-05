# frozen_string_literal: true

class Address < ApplicationRecord
  # rubocop:disable Rails/HasManyOrHasOneDependent
  has_one :store
  # rubocop:enable Rails/HasManyOrHasOneDependent

  validates :state, :city, :district, presence: true, length: { in: 2..50 }

  validates :cep, presence: true, length: { is: 9 }
  validates :number, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 9_999_999 }
  validates :street, presence: true, length: { in: 2..100 }
  validates :complement, length: { maximum: 1000 }
end
