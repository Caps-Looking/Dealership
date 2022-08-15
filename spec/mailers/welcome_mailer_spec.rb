# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WelcomeMailer, type: :mailer do
  describe 'notify' do
    let(:user) { build(:user) }
    let(:mail) { described_class.welcome_send(user) }

    it 'renders the headers' do
      expect(mail.subject).to eq(I18n.t('mailers.welcome_mailer.welcome'))
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(['info@dealership.com'])
    end
  end
end
