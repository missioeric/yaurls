require 'rails_helper'

RSpec.describe "links/show", type: :view do
  before(:each) do
    @link = assign(:link, Link.create!(
      :full_url => "Full Url",
      :short_url => "Short Url",
      :clicks => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Full Url/)
    expect(rendered).to match(/Short Url/)
    expect(rendered).to match(/1/)
  end
end
