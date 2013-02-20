module ApplicationHelper
	def getSpots(activity) 
			[1,2,3]
	end
	
	 def resource_name
	   :account
	 end
	
	 def resource
	   @resource ||= Account.new
	 end
	
	 def devise_mapping
	   @devise_mapping ||= Devise.mappings[:account]
	 end
	 
	 def current_user
	   @current_user = Account.find(current_account)
	 end
	 
	 def ticketsSold(activity)
    p = Payment.find(:all, :conditions => {:activity_id => activity.id})
    tickets_sold = 0
    p.each do |payment|
      tickets_sold = tickets_sold + payment.quantity
    end
     return tickets_sold
  end
  
  def currentTicketPriceDick(activity)
    payments = Payment.find(:all, :conditions => {:activity_id => activity.id})
    increment = (activity.starting_ticket - activity.reduced_ticket) / (activity.max_capacity - activity.min_capacity)
    current_ticket = (activity.starting_ticket) - (increment * (ticketsSold(activity) - activity.min_capacity))
    return current_ticket
  end
end
