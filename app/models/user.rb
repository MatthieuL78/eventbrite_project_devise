class User < ApplicationRecord
  attr_accessor :sign_up_code
  validates :sign_up_code, on: :create, presence: true, inclusion: { in: ["thpevent"] }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :created_events, class_name: 'Event', foreign_key: :creator_id
  has_many :event_attendees , foreign_key: 'attendee_id'
  has_many :attending_events, through: :event_attendees, source: :event


end
