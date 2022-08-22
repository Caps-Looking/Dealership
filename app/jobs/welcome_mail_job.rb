# frozen_string_literal: true

class WelcomeMailJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    @user = User.find(user_id)
    WelcomeMailer.welcome_send(@user).deliver_now
  end
end
