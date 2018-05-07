require 'rails_helper'

RSpec.describe "events/edit", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      :name => "MyString",
      :place => "MyString",
      : => "",
      :creator => nil
    ))
  end

  it "renders the edit event form" do
    render

    assert_select "form[action=?][method=?]", event_path(@event), "post" do

      assert_select "input[name=?]", "event[name]"

      assert_select "input[name=?]", "event[place]"

      assert_select "input[name=?]", "event[]"

      assert_select "input[name=?]", "event[creator_id]"
    end
  end
end
