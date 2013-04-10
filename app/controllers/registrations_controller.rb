class RegistrationsController < Devise::RegistrationsController
  def new
  	super
  end
  
  def create
    #merchant_name = params[:account][:first_name] + " " + params[:account][:last_name]
    #merchant = Balanced::Marketplace.my_marketplace.create_merchant(
    #params[:account][:email], nil, nil, merchant_name)
    
	  super
	  UserMailer.welcome_email(@account).deliver
  end
  
  def edit
    super
  end
  
  def update
    super
  end
  
  def destroy
    
    
    super
  end
end
