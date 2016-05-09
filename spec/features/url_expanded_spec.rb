require "rails_helper"

Capybara.current_driver = :selenium

feature "URL is expanded" do

  scenario "successfully" do

    link = create(:link)
    expanded = ENV['BASE_URL'] + link.short_url
    visit expanded

  end
end
