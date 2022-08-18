# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    let!(:users) { create_list :user, 5 }

    before { get admin_users_path }

    it { is_expected.to render_template :index }
    it { expect(response).to be_successful }

    it 'populate with users' do
      expect(assigns(:users)).to match_array users
    end
  end

  describe 'GET /new' do
    before { get new_admin_user_path }

    it { is_expected.to render_template :new }
    it { expect(response).to be_successful }

    it 'create a new User' do
      expect(assigns(:user)).to be_a User
    end
  end

  describe 'GET /edit' do
    let!(:user) { create(:user) }

    before { get edit_admin_user_path(user) }

    it { is_expected.to render_template :edit }
    it { expect(response).to be_successful }

    it 'initialize with returned user' do
      expect(assigns(:user)).to be_a(User) & have_attributes(id: user.id)
    end
  end

  describe 'GET /show' do
    let!(:user) { create(:user) }

    before { get admin_user_path(user) }

    it { is_expected.to render_template :show }
    it { expect(response).to be_successful }

    it 'initialize with returned user' do
      expect(assigns(:user)).to eq user
    end
  end

  describe 'POST /create' do
    subject(:create_user) do
      post admin_users_path, params: { user: user_params }
    end

    context 'with valid params' do
      let(:user_params) do
        {
          name: 'Test User',
          username: 'testuser',
          email: 'testuser@email.com',
          user_type: 1,
          password: '123123',
          password_confirmation: '123123'
        }
      end

      it { expect(create_user).to redirect_to admin_user_path(assigns(:user)) }

      it 'saves the correct user' do
        expect { create_user }.to change(User, :count).by 1
        expect(assigns(:user)).to have_attributes(name: 'Test User', email: 'testuser@email.com')
      end
    end

    context 'with invalid params' do
      let(:user_params) do
        {
          name: 'Test User',
          username: 'testuser',
          email: 'testuser@email',
          user_type: 1,
          password: '123123',
          password_confirmation: '123123'
        }
      end

      it { expect(create_user).to render_template(:new) }
    end
  end

  describe 'PUT /update' do
    subject(:put_user) do
      put admin_user_path(user), params: { user: user_params }
    end

    let(:user) { create(:user, name: 'Test User') }
    let(:store) { create(:store, name: 'A Store') }

    context 'with valid params' do
      let(:user_params) do
        { name: 'Test User 2', user_type: 2, store_id: store.id }
      end

      it { expect(put_user).to redirect_to admin_user_path(user) }

      it 'updates the correct store' do
        expect { put_user }.to change(User, :count).by 1
        expect(assigns(:user)).to have_attributes(
          name: 'Test User 2',
          user_type: 2,
          store: have_attributes(name: 'A Store')
        )
      end
    end

    context 'with invalid params' do
      let(:user_params) do
        { email: 'wrong@email' }
      end

      it { expect(put_user).to render_template :edit }
    end
  end

  describe 'DELETE /destroy' do
    subject(:delete_user) do
      delete admin_user_path(user)
    end

    let!(:user) { create(:user) }

    it { expect { delete_user }.to change(User, :count).by(-1) }
    it { expect(delete_user).to redirect_to admin_users_path }
  end
end
