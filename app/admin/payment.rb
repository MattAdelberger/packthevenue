ActiveAdmin.register Payment do   
  
  batch_action :charge_cards do |selection|
      
      Payment.find(selection).each do |payment|
        
        if payment.status != "Successful"
        current_ticket_price = payment.activity.final_price
        buyer = Balanced::Account.find("/v1/marketplaces/TEST-MP6AYyZ4i81jgO8P66ljOWH8/accounts/#{payment.account.balanced_account_id}")
        buyer.debit(
              :appears_on_statement_as => 'Pack The Venue',
              :amount => current_ticket_price,
              :description => 'Pack The Venue',
        )
        payment.status = "Card Successfully Charged"
        payment.save
        end
      end
      redirect_to collection_path, :alert => "Cards Successfully Charged"
    end
    
  index do 
    selectable_column                           
    column :activity                    
    column :account
    column :status   
    default_actions                   
  end                                 

  filter :email                       

  form do |f|                         
    f.inputs "Account Details" do       
      f.input :email                  
      f.input :password               
      f.input :password_confirmation  
    end                               
    f.buttons                         
  end                                 
end 
