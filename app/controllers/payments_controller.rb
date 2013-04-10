class PaymentsController < ApplicationController
  include PaymentsHelper
  
	before_filter :authenticate_account!, :except => [:make_payment, :confirmation]
	
	def make_payment
    session["ticket_quantity"] = params[:ticket_quantity]
    session["activity_id"] = params[:activity_id]
    redirect_to confirmation_path
  end
	
	def confirmation
		@account = Account.new
		@payment = Payment.new
	end
	
	def create 
	  @payment = Payment.new(params[:payment])
	  @account = Account.find(current_account.id)
    @payment.account_id = current_account.id
    @payment.activity_id = session["activity_id"]
    @payment.quantity = session["ticket_quantity"]
    @payment.status = "Card Verified"
    @payment.uri = params[:payment][:uri]
    
    card = Balanced::Card.find(params[:payment][:uri])
    if card.is_valid 
      account = Balanced::Account.find("/v1/marketplaces/TEST-MP6AYyZ4i81jgO8P66ljOWH8/accounts/#{@account.balanced_account_id}")
      account.add_card(params[:payment][:uri])
      if @payment.save 
        redirect_to profile_path
        EventMailer.event_tickets_email(@payment).deliver
      else
        redirect_to :controller => 'activity', :action => 'show(@payment.activity_id)'
      end
    else
       redirect_to :controller => 'activity', :action => 'show(@payment.activity_id)'
    end
	end
end
