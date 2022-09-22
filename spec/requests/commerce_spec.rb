# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Commerce', type: :request do
  describe 'GET /index' do
    let!(:vehicles) { create_list :vehicle, 15 }

    let(:search_params) { {} }

    before { get commerce_index_path, params: search_params }

    it { is_expected.to render_template :index }
    it { expect(response).to be_successful }

    context 'with first 10 vehicles' do
      it { expect(assigns(:vehicles)).to match_array vehicles.each_slice(10).to_a.first }
    end

    context 'with last 5 vehicles' do
      let(:search_params) { { page: 2 } }

      it { expect(assigns(:vehicles)).to match_array vehicles.each_slice(10).to_a.last }
    end
  end

  describe 'GET /show' do
  end
end
