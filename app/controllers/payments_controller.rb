class PaymentsController < ApplicationController
	before_filter :authenticate_account!, :except => [:make_payment, :confirmation]
	def make_payment
		activity = Activity.find(params[:activity_id])
		tmp = {}
		activity.ticket_types.each do |t|
			tmp[t.ticketname.downcase] = params[t.ticketname.downcase]
		end 
		session["tickets_selected"] = tmp
		session["activity_id"] = params[:activity_id]
		redirect_to confirmation_path
	end
	
	def confirmation
		@account = Account.new
		#session["previous"] = request.fullpath
	end
	
	def new
		
	end
end
