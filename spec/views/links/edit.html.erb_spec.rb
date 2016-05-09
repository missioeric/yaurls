require 'rails_helper'

RSpec.describe "links/edit", type: :view do
  before(:each) do
    @link = assign(:link, Link.create!(
      :full_url => "MyString",
      :short_url => "MyString",
      :clicks => 1
    ))
  end

  it "renders the edit link form" do
    render

    assert_select "form[action=?][method=?]", link_path(@link), "post" do

      assert_select "input#link_full_url[name=?]", "link[full_url]"

      assert_select "input#link_short_url[name=?]", "link[short_url]"

      assert_select "input#link_clicks[name=?]", "link[clicks]"
    end
  end
end
