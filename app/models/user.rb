# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :validatable

  has_enumeration_for :user_type

  belongs_to :store, dependent: :destroy, optional: true
  accepts_nested_attributes_for :store

  validates :name, presence: true, length: { in: 2..50 }
  validates :username, uniqueness: true, presence: true, length: { in: 2..50 }
  validates :email, email: { mode: :strict, require_fqdn: true }
  validates :user_type, presence: true
  validates :store, presence: true, if: :store?

  after_create :welcome_send

  def welcome_send
    WelcomeMailer.welcome_send(self).deliver_now
  end

  def store?
    UserType::STORE == :user_type
  end
end
