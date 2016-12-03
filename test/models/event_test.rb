require 'test_helper'

class EventTest < ActiveSupport::TestCase
  def setup
    @user = users(:vladimir)
    # This code is not idiomatically correct.
    @event = @user.events.build(title: "Melton day", description: "Lorem ipsum", location: "MPR",
      host: "Melton Fellows", start: "2016-03-06 14:36:03", end_time:"2016-03-06 15:36:03")
  end

  test "should be valid" do
    assert @event.valid?
  end

  test "user id should be present" do
    @event.user_id = nil
    assert_not @event.valid?
  end


  test "description should be present" do
    @event.description = "   "
    assert_not @event.valid?
  end

  test "location should be present" do
    @event.location = "   "
    assert_not @event.valid?
  end

  test "host should be present" do
    @event.host = "   "
    assert_not @event.valid?
  end

  test "start should be present" do
    @event.start = "   "
    assert_not @event.valid?
  end

  test "end should be present" do
    @event.end_time = "   "
    assert_not @event.valid?
  end

  test "order should be most recent first" do
    assert_equal events(:most_recent), Event.first
  end
end
