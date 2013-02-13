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
	 
	 def ticketsRemaining(activity)
    p = Payment.find(:all, :conditions => {:activity_id => activity.id})
    total_quantity = 0
    p.each do |payment|
      total_quantity = total_quantity + payment.quantity
    end
     tickets_remaining = activity.max_capacity - total_quantity
     return tickets_remaining
  end
end
