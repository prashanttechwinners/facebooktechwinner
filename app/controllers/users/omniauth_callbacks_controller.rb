# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
 def sign_in_with(provider_name)
    # binding.pry
    @user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect @user, :event => :authentication
    set_flash_message(:notice, :success, :kind => provider_name) if is_navigational_format?
  end

  def facebook
    # # You need to implement the method below in your model (e.g. app/models/user.rb)
    # @user = User.from_omniauth(request.env["omniauth.auth"])

    # if @user.persisted?
    #   sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
    #   set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    # else
    #   session["devise.facebook_data"] = request.env["omniauth.auth"]
    #   redirect_to new_user_registration_url
    # end
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
