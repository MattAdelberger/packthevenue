class UsersController < ApplicationController
    
    before_filter :authenticate_account!, :only => [:dashboard]
  
  def index
@users = Account.all

respond_to do |format|
  format.html # index.html.erb
  format.xml  { render :xml => @users }
end
end

  def dashboard
    @user = Account.find(current_account) 
    @following = @user.all_following
    @followed_activities = Activity.where(:account_id => @following)
    @following_count = @user.follow_count
    @title = combine_name(@user.first_name, @user.last_name)
  end
  
def follow
  user1 = Account.find(current_account)
  user2 = Account.find(params[:id])

    if user1 == user2
      flash[:error] = "You cannot follow yourself."
      redirect_to :action => :profile
    else
      user1.follow(user2)
      flash[:notice] = "You are now following #{combine_name(user2.first_name, user2.last_name)}."
      redirect_to :action => :dashboard
    end

end

def unfollow
  user1 = Account.find(current_account)
  user2 = Account.find(params[:id])
  user1.stop_following(user2)
  redirect_to :action => :dashboard
end

def profile
  @user = Account.find(current_account)
  @followers = @user.followers_count
  @activities = Activity.where(:account_id => @user)
  @title = combine_name(@user.first_name, @user.last_name)
end

  def show
  @user = Account.find(params[:id])
  @title = combine_name(@user.first_name, @user.last_name)
  @followers = @user.followers_count
  @activities = Activity.where(:account_id => @user)
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end
  
end
