class AddIndexToAttendees < ActiveRecord::Migration
  def change
    add_index :attendees, [:event_id, :user_id], unique: true
  end
end
