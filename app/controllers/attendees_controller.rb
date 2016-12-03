class AttendeesController < ApplicationController
  include SessionsHelper

  def create
    @event = Event.find_by_id(params[:event_id])

    @attendee = @event.attendees.build(user_id: current_user.id)
    respond_to do |format|
      if @attendee.save
        format.html { redirect_to root_url,
          notice: "You have successfully registered for this event." }
        format.js { @event }
      else
        format.html {redirect_to root_url,
          notice: "You are already registered for this event." }
      end
    end

  end

  def index
    @title = "Attendees"
    @event = Event.new
    @attendees = Attendee.where(event_id: params[:event_id].to_i)
    @users = []
  end

  private
  def attendee_params
    params.permit(:event_id)
  end

end
