require 'test_helper'

class EventsInterfaceTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:vladimir)
  end

  test "micropost interface" do
    log_in_as(@user)
    get root_path
    assert_select 'div.pagination'
    # Invalid submission
    assert_no_difference 'Event.count' do
      post events_path, event: { description: "" }
    end
    assert_select 'div#error_explanation'
    # Valid submission
    description = "Melton Event for General Melton Orientation"
    assert_difference 'Event.count', 1 do
      post events_path, event: { title: "Melton day", description: description, location: "MPR",
        host: "Melton Fellows", start: "2016-03-06 14:36:03", end_time:"2016-03-06 15:36:03" }
    end
    assert_redirected_to root_url
    follow_redirect!
    assert_match description, response.body
    # Delete a post.
    assert_select 'a', text: 'delete'
    first_event = @user.events.paginate(page: 1).first
    assert_difference 'Event.count', -1 do
      delete event_path(first_event)
    end
    # Visit a different user.
    get user_path(users(:brandon))
    assert_select 'a', text: 'delete', count: 0
  end

  test "event sidebar count" do
   log_in_as(@user)
   get root_path
   assert_match "#{@user.events.count} events", response.body
   # User with zero microposts
   other_user = users(:brandon)
   log_in_as(other_user)
   get root_path
   assert_match "0 events", response.body
   other_user.events.create!( title: "Melton day", description: description, location: "MPR",
     host: "Melton Fellows", start: "2016-03-06 14:36:03", end_time:"2016-03-06 15:36:03")
   get root_path
   assert_match "#{@user.events.count} events", response.body
 end
end
