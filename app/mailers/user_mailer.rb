class UserMailer < ApplicationMailer

  default from: 'prashant13indore@gmail.com'
  def welcome_email(user)

  	@user = user
    # @user = params[:user]
    @url  = 'http://localhost:3000/users/sign_in'
    mail(to: user.email, subject: 'Welcome to Techwinners.infosystem!!')
  end
end