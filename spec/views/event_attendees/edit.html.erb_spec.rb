require 'rails_helper'

RSpec.describe "event_attendees/edit", type: :view do
  before(:each) do
    @event_attendee = assign(:event_attendee, EventAttendee.create!(
      :attendee => nil,
      :event => nil
    ))
  end

  it "renders the edit event_attendee form" do
    render

    assert_select "form[action=?][method=?]", event_attendee_path(@event_attendee), "post" do

      assert_select "input[name=?]", "event_attendee[attendee_id]"

      assert_select "input[name=?]", "event_attendee[event_id]"
    end
  end
end
