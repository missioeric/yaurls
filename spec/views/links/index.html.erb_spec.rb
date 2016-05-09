require 'rails_helper'

RSpec.describe "links/index", type: :view do
  before(:each) do
    assign(:links, [
      Link.create!(
        :full_url => "Full Url",
        :short_url => "Short Url",
        :clicks => 1
      ),
      Link.create!(
        :full_url => "Full Url",
        :short_url => "Short Url",
        :clicks => 1
      )
    ])
  end

  it "renders a list of links" do
    render
    assert_select "tr>td", :text => "Full Url".to_s, :count => 2
    assert_select "tr>td", :text => "Short Url".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
