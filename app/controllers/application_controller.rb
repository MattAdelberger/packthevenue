class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def after_sign_in_path_for(resource)
    profile_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end
  
  def redirect_to_sign_up
    if signed_in?.blank?
      redirect_to new_account_path
    else
      redirect_to profile_path
    end
  end
  
  def currentTicketPrice(activity)
    payments = Payment.find(:all, :conditions => {:activity_id => activity.id})
    increment = (activity.starting_ticket.to_f / (activity.max_capacity - activity.min_capacity))
    current_ticket = increment * view_context.ticketsRemaining(activity)
    return current_ticket
  end
  
  def header_search
  	phrase = params[:phrase]
  	queryString = "%#{phrase}%"
  	a = Account.find(:all, :conditions => ["first_name || ' ' || last_name like ?", queryString], :limit => 4)
  	act = Activity.find(:all, :conditions => ["name like ?", queryString], :limit => 4)
  	render :json => {:accounts => a, :activities => act}
  end
  
  #concat_ws(' ', first_name, last_name)
  
 def combine_name(first, last)
		first + " " + last
	end
	
	def check_privileges!(activity)
  redirect_to "/profile" unless current_user.id = activity.account.id
end
end
