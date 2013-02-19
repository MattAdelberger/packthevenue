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
    @payment.account_id = current_account.id
    @payment.activity_id = session["activity_id"]
    @payment.quantity = session["ticket_quantity"]
    @payment.status = "Card Verified"
    if @payment.save 
      redirect_to profile_path
    else
      render :action => :confirmation
    end
	end
end
