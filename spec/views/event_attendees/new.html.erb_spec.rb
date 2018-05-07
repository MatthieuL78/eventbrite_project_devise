require 'rails_helper'

RSpec.describe "event_attendees/new", type: :view do
  before(:each) do
    assign(:event_attendee, EventAttendee.new(
      :attendee => nil,
      :event => nil
    ))
  end

  it "renders new event_attendee form" do
    render

    assert_select "form[action=?][method=?]", event_attendees_path, "post" do

      assert_select "input[name=?]", "event_attendee[attendee_id]"

      assert_select "input[name=?]", "event_attendee[event_id]"
    end
  end
end
