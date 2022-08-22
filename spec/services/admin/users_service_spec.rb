# frozen_string_literal: true

require 'rails_helper'

describe Admin::UsersService, type: :service do
  context 'when is creating' do
    context 'with valid parameters' do
      params = {
        name: 'Test User',
        username: 'testuser',
        email: 'testuser@email.com',
        user_type: 1,
        password: '123123',
        password_confirmation: '123123'
      }
      users_service = described_class.new(User.new, params)

      it { expect { users_service.save! }.to change(User, :count).by(1) }

      it {
        expect(users_service.save!).to have_attributes(
          name: 'Test User',
          email: 'testuser@email.com',
          store_id: nil
        )
      }
    end

    context 'with invalid parameters' do
      params = {
        name: 'Test User'
      }
      users_service = described_class.new(User.new, params)

      it { expect { users_service.save! }.to raise_error(ActiveRecord::RecordInvalid) }
    end
  end

  context 'when is editing' do
    let!(:user) { create(:user, name: 'Test User') }

    context 'with valid parameters' do
      params = {
        name: 'Test User 2',
        user_type: 1
      }

      it { expect { described_class.new(user, params).save! }.not_to change(User, :count) }
      it { expect { described_class.new(user, params).save! }.not_to change { ActionMailer::Base.deliveries.count } }

      it {
        expect(described_class.new(user, params).save!).to have_attributes(
          name: 'Test User 2',
          email: user.email,
          store: nil
        )
      }
    end

    context 'with invalid parameters' do
      params = { name: '' }

      it { expect { described_class.new(user, params).save! }.to raise_error(ActiveRecord::RecordInvalid) }
    end
  end
end
