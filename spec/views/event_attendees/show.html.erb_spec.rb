require 'rails_helper'

RSpec.describe "event_attendees/show", type: :view do
  before(:each) do
    @event_attendee = assign(:event_attendee, EventAttendee.create!(
      :attendee => nil,
      :event => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
