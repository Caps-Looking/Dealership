# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WelcomeMailJob, type: :job do
  describe 'with user id' do
    let!(:user) { create(:user, name: 'Test User') }

    it 'adds job to queue and send mail' do
      expect { described_class.perform_later(user.id) }.to have_enqueued_job(described_class)
      expect { described_class.perform_now(user.id) }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end
  end
end
