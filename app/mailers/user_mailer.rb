class UserMailer < ActionMailer::Base
  default from: "info@packthevenue.com"
  
  def welcome_email(account)
    @account = account
    mail(:to => account.email, :subject => "Thanks for signing up. Now what?", :from => "\"Pack The Venue\" <info@packthevenue.com>")
  end
end
