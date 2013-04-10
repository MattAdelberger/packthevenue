class PagesController < ApplicationController
  
  before_filter :send_to_profile, :except => [:not_authorized]
    
  def landing
    @title = "Home"
  end
  
  def how_it_works
    @title = "How It Works"
  end
  
  def about
    @title = "About Us"
  end
  
  def jobs
    @title = "Jobs"
  end
  
  def terms_conditions
    @title = "Terms & Conditions"
  end
  
  def privacy_policy
    @title = "Privacy Policy"
  end
  
  def splash
    render :layout => false
  end
  
  def sign_up
    @title = "Register"
  end
  
  def not_authorized
    @title = "Not Authorized"
  end
  
  private 
  
  def send_to_profile
    if account_signed_in?
      redirect_to profile_path
    end
  end
end
