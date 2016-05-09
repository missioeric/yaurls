require "rails_helper"

feature "URL is shortened" do
  scenario "successfully" do
    visit root_path

    fill_in "Full url", with: "http://www.rubydoc.info/github/Fullscreen/bh/master/Bh/Helpers"
    click_on "Shorten"

    @link = Link.find_by_full_url('http://www.rubydoc.info/github/Fullscreen/bh/master/Bh/Helpers')

    expect(@link.short_url.length).to be < 6
    expect(page).to have_css 'h1', text: 'An Easy New Way to Shorten Your URLs'
  end
end
