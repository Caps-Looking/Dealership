# frozen_string_literal: true

class WelcomeMailJob
  include Sidekiq::Job

  def perform(user_id)
    @user = User.find(user_id)
    WelcomeMailer.welcome_send(@user).deliver_now
  end
end
