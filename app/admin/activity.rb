ActiveAdmin.register Activity do 
  
  batch_action :pay_host do |selection|
      
      Activity.find(selection).each do |activity|
          bank_account = Balanced::BankAccount.find("/v1/marketplaces/TEST-MP6AYyZ4i81jgO8P66ljOWH8/bank_accounts/#{activity.account.balanced_bank_id}")
          bank_account.credit(activity.final_price)
          activity.status = "Processing Complete"
          activity.save
      end
      redirect_to collection_path, :alert => "Event Host Successfully Paid"
    end
      
  index do
    selectable_column                          
    column :account                   
    column :name   
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