# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :validatable

  has_enumeration_for :user_type, create_helpers: true

  belongs_to :store, optional: true

  validates :name, presence: true, length: { in: 2..50 }
  validates :username, uniqueness: true, presence: true, length: { in: 2..50 }
  validates :email, email: { mode: :strict, require_fqdn: true }
  validates :user_type, presence: true
  validates :store, presence: true, if: :store?
end
