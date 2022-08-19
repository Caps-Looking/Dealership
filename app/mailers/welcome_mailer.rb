# frozen_string_literal: true

class WelcomeMailer < ApplicationMailer
  def welcome_send(user)
    @user = user
    mail to: @user.email, subject: I18n.t('mailers.welcome_mailer.subject')
  end
end
