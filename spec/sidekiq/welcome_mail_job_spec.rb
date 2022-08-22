# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WelcomeMailJob, type: :job do
  describe 'with user id' do
    let!(:user) { create(:user, name: 'Test User') }

    it 'adds job to queue and send mail' do
      expect { described_class.perform_async(user.id) }.to change(described_class.jobs, :size).by(1)
      expect { described_class.drain }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end
  end
end
