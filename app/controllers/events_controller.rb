class EventsController < ApplicationController

  before_action :logged_in_user, only: [:create, :show, :destroy]
  before_action :correct_user,   only: :destroy
  before_action :set_event, only: :show

 def create
   @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = "Event created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
 end

 def show
 end

 def destroy
   @event.destroy
   flash[:success] = "Event deleted"
   redirect_to request.referrer || root_url
 end

 def attending

 end

 def attendees

 end

 private

   def event_params
     params.require(:event).permit(:title, :description, :location, :host, :start, :end_time, :picture)
   end

   def set_event
     @event = Event.find(params[:id])
   end

   def correct_user
      @event = current_user.events.find_by(id: params[:id])
      redirect_to root_url if @event.nil?
    end
end
