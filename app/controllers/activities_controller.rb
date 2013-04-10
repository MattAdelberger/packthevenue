class ActivitiesController < ApplicationController
  
  before_filter :authenticate_account!, :except => [:show]
  
  load_and_authorize_resource

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
       session["current_price"] = @current_price
      @saving_price = @activity.starting_ticket - @current_price
    else
      @current_price = @activity.starting_ticket
      session["current_price"] = @current_price
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
    @activity.status = "created"
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
  
  def close_event
    @activity = Activity.find(params[:id])
    @activity.status = "Processing"
    if view_context.ticketsSold(@activity) > @activity.min_capacity
      @activity.final_price = currentTicketPrice(@activity).to_i * 100
    else
      @activity.final_price = (@activity.starting_ticket).to_i * 100
    end
    if @activity.save 
      redirect_to @activity
    else
      redirect_to @activity
    end
  end
end
