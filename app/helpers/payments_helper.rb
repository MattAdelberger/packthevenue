module PaymentsHelper
	def activitySuccess(activity)
		p = Payment.find(:all, :conditions => {:activity_id => activity.id})
		count = 0
		p.each do |payment|
			count = count + payment.tickets.size
		end
		activity.min_signups - count
	end
	
	def ticketsBought(activity, accountId)
		p = Payment.find(:all, :conditions => {:activity_id => activity.id, :account_id => accountId})
		count = 1
		p.each do |payment|
			payment.tickets.each do |t|
				count = count + 1
			end
		end
		count - 1
	end
end
