class Attendee < ActiveRecord::Base
  validates :user_id, uniqueness: {scope: :event_id}, presence: true
  validates :event_id, presence: true
  belongs_to :event
  belongs_to :user
end
