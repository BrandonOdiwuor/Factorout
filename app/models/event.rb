class Event < ActiveRecord::Base
  extend TimeSplitter::Accessors
  split_accessor :start
  split_accessor :end_time
  belongs_to :user
  has_many :attendees
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validate  :picture_size
  validates :user_id, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :host, presence: true
  validates :location, presence: true
  validates :start, presence: true
  validates :end_time, presence: true

  def attending?(other_user)
    @attendees = self.attendees.build(user_id: other_user.id)
    unless @attendees.valid?
      return true
    else
      return false
    end
  end

  private

     # Validates the size of an uploaded picture.
     def picture_size
       if picture.size > 5.megabytes
         errors.add(:picture, "should be less than 5MB")
       end
     end
end
