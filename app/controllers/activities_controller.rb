class ActivitiesController < ApplicationController
  
  before_filter :authenticate_account!, :except => [:show]
  
  def index
    @activities = Activity.all
  end

  def show
    @activity = Activity.find(params[:id])
    @map = @activity.to_gmaps4rails
  end

  def new
    @activity = Activity.new
    @activity.ticket_types.build    
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def create
    @activity = Activity.new(params[:activity])
    @activity.account_id = current_account.id
    if @activity.save 
      redirect_to @activity
    else
      render :action => :new
    end
  end

  def update
    @activity = Activity.find(params[:id])
    if @activity.update_attributes(params[:activity])
      redirect_to @activty
    else
      render :action => :new
    end
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    redirect_to activities_path
  end
end
