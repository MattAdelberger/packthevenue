class UserMailer < ActionMailer::Base
  default from: "matt.adelberger@gmail.com"
  
  def welcome_email(user)
    @user = user
    @url  = 'http://packthevenue.com'
    mail(to: user.email, subject: 'Pack The Venue Welcomes You!')
  end
end
