# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
 def sign_in_with(provider_name)
    # binding.pry
    @user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect @user, :event => :authentication
    set_flash_message(:notice, :success, :kind => provider_name) if is_navigational_format?
  end

  def facebook
    sign_in_with "Facebook"
  end

  def linkedin
    sign_in_with "LinkedIn"
  end

  def twitter
    sign_in_with "Twitter"
  end

  def google_oauth2
    sign_in_with "Google"
  end

  def developer
    sign_in_with "Developer"
  end
end
