class PagesController < ApplicationController
  # skip_before_action :authenticate_user!,  only: [:home]

  def home
    require 'twilio-ruby'

    @tutor = 'alex@lewagon.com'

    identity = current_user.email
    @token = Twilio::JWT::AccessToken.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_API_KEY'], ENV['TWILIO_API_SECRET'], identity: identity)

    grant = Twilio::JWT::AccessToken::VideoGrant.new
    # grant.room = 'DailyStandup'
    @token.add_grant(grant)
  end
end


