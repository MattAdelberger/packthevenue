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

end
