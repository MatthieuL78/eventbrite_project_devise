class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :event_attendees
  has_many :attendees, through: :event_attendees

  validates :name, :date, :place, :description, presence: true

end
