module AttendeeHelper

  def username(attendee)
    @user = User.find(attendee.user_id)
    @user.username
  end


  def email(attendee)
    @user = User.find(attendee.user_id)
    @user.email
  end

end
