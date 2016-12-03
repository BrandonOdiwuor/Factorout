require 'test_helper'

class EventsControllerTest < ActionController::TestCase

  def setup
    @event = events(:one)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Event.count' do
      post :create, event: { title: "Melton day", description: "Lorem ipsum", location: "MPR",
        host: "Melton Fellows", start: "2016-03-06 14:36:03", end_time:"2016-03-06 15:36:03" }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Event.count' do
      delete :destroy, id: @event
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy for wrong event" do
    log_in_as(users(:vladimir))
    event = events(:one)
    assert_no_difference 'Event.count' do
      delete :destroy, id: event
    end
    assert_redirected_to root_url
  end
end
