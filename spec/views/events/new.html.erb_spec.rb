require 'rails_helper'

RSpec.describe "events/new", type: :view do
  before(:each) do
    assign(:event, Event.new(
      :name => "MyString",
      :place => "MyString",
      : => "",
      :creator => nil
    ))
  end

  it "renders new event form" do
    render

    assert_select "form[action=?][method=?]", events_path, "post" do

      assert_select "input[name=?]", "event[name]"

      assert_select "input[name=?]", "event[place]"

      assert_select "input[name=?]", "event[]"

      assert_select "input[name=?]", "event[price]"

      assert_select "input[name=?]", "event[creator_id]"
    end
  end
end
