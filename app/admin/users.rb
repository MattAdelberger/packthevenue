ActiveAdmin.register Account do
  

       
  index do
    selectable_column                            
    column :email                     
    column :current_sign_in_at        
    column :last_sign_in_at           
    column :sign_in_count             
    default_actions                   
  end                                 

  filter :email                       

  form do |f|                         
    f.inputs "Account Details" do
      f.input :first_name
      f.input :last_name
      f.input :company_name
      f.input :zip_code 
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :type_of_user
      f.input :balanced_account_id
      f.input :balanced_card_id 
      f.input :balanced_bank_id 
    end                               
    f.buttons                         
  end                                 
end 