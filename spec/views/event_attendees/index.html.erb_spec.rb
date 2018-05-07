require 'rails_helper'

RSpec.describe "event_attendees/index", type: :view do
  before(:each) do
    assign(:event_attendees, [
      EventAttendee.create!(
        :attendee => nil,
        :event => nil
      ),
      EventAttendee.create!(
        :attendee => nil,
        :event => nil
      )
    ])
  end

  it "renders a list of event_attendees" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
