class ActivitiesController < ApplicationController
  
  before_filter :authenticate_account!, :except => [:show]

  def index
    @activities = Activity.all
  end

  def guest_list
    @activity = Activity.find(params[:id])
    @payments = Payment.find(:all, :conditions => {:activity_id => @activity.id})
  end

  def show
    @activity = Activity.find(params[:id])
    @map = @activity.to_gmaps4rails
    @tickets_remaining = @activity.max_capacity - view_context.ticketsSold(@activity)
    @guest_list = Payment.where(:activity_id => @activity.id).select("distinct account_id")
   
    if view_context.ticketsSold(@activity) > @activity.min_capacity
      @current_price = currentTicketPrice(@activity)
      @saving_price = @activity.starting_ticket - @current_price
    else
      @current_price = @activity.starting_ticket
      @saving_price = 0
    end
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
      redirect_to @activity
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
