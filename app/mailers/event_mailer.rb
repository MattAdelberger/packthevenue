class EventMailer < ActionMailer::Base
  default from: "info@packthevenue.com"
  
  def event_tickets_email(payment)
    @payment = payment
    mail(:to => payment.account.email, :subject => "Thanks for purchasing tickets", :from => "\"Pack The Venue\" <info@packthevenue.com>")
  end
end