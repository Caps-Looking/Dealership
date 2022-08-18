# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Stores', type: :request do
  describe 'GET /index' do
    let!(:stores) { create_list :store, 5 }

    before { get admin_stores_path }

    it { is_expected.to render_template :index }
    it { expect(response).to be_successful }

    it 'populate with stores' do
      expect(assigns(:stores)).to match_array stores
    end
  end

  describe 'GET /new' do
    before { get new_admin_store_path }

    it { is_expected.to render_template :new }
    it { expect(response).to be_successful }

    it 'create a new Store' do
      expect(assigns(:store)).to be_a Store
    end
  end

  describe 'GET /edit' do
    let!(:store) { create(:store) }

    before { get edit_admin_store_path(store) }

    it { is_expected.to render_template :edit }
    it { expect(response).to be_successful }

    it 'initialize with returned store' do
      expect(assigns(:store)).to be_a(Store) & have_attributes(id: store.id)
    end
  end

  describe 'GET /show' do
    let!(:store) { create(:store) }

    before { get admin_store_path(store) }

    it { is_expected.to render_template :show }
    it { expect(response).to be_successful }

    it 'initialize with returned store' do
      expect(assigns(:store)).to eq store
    end
  end

  describe 'POST /create' do
    subject(:create_store) do
      post admin_stores_path, params: { store: store_params }
    end

    context 'with valid params' do
      let(:store_params) do
        {
          name: 'Test Store',
          address_attributes: {
            cep: '12312-312',
            state: 'SP',
            city: 'São Paulo',
            district: 'District',
            street: 'Street street',
            number: '123',
            complement: 'A complement'
          }
        }
      end

      it { expect(create_store).to redirect_to admin_store_path(assigns(:store)) }

      it 'saves the correct store' do
        expect { create_store }.to change(Store, :count).by 1
        expect(assigns(:store)).to have_attributes(name: 'Test Store',
                                                   address: have_attributes(complement: 'A complement'))
      end
    end

    context 'with invalid params' do
      before { create(:store, name: 'Test Store') }

      let(:store_params) do
        {
          name: 'Test Store',
          address_attributes: {
            cep: '12312-312',
            state: 'SP',
            city: 'São Paulo',
            district: 'District',
            street: 'Street street',
            number: '123',
            complement: 'A complement'
          }
        }
      end

      it { expect(create_store).to render_template(:new) }
    end
  end

  describe 'PUT /update' do
    subject(:put_store) do
      put admin_store_path(store), params: { store: store_params }
    end

    let(:address) { create(:address, cep: '12312-312') }
    let(:store) { create(:store, name: 'Test Store', address:) }

    context 'with valid params' do
      let(:store_params) do
        { name: 'Test Store 2' }
      end

      it { expect(put_store).to redirect_to admin_store_path(store) }

      it 'updates the correct store' do
        expect { put_store }.to change(Store, :count).by 1
        expect(assigns(:store)).to have_attributes(name: 'Test Store 2', address: have_attributes(cep: '12312-312'))
      end
    end

    context 'with invalid params' do
      let(:store_params) do
        {
          name: 'Test Store 2',
          address_attributes: { country: '' }
        }
      end

      it { expect(put_store).to render_template :edit }
    end
  end

  describe 'DELETE /destroy' do
    subject(:delete_store) do
      delete admin_store_path(store)
    end

    context 'with users' do
      let(:store) { create(:store) }
      let!(:user) { create(:user, store:) }

      it { expect(delete_store).to render_template :show }
    end

    context 'without users' do
      let!(:store) { create(:store) }

      it { expect { delete_store }.to change(Store, :count).by(-1) }
      it { expect(delete_store).to redirect_to admin_stores_path }
    end
  end
end
