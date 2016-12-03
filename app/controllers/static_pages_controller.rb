class StaticPagesController < ApplicationController
  def contact
  end

  def help
  end

  def home
    @user = User.new
    #render template: "users/new"
    if logged_in?
     @event  = current_user.events.build
     @feed_items = current_user.feed.paginate(page: params[:page])
   end
  end
end
