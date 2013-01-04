class PagesController < ApplicationController
    
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
end
