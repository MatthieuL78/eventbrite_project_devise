class CreateEventAttendees < ActiveRecord::Migration[5.2]
  def change
    create_table :event_attendees do |t|
      t.belongs_to :attendee, index: true
      t.belongs_to :event, index: true

      t.timestamps null: false
    end
  end
end
