require 'rails_helper'

RSpec.describe "Announcements", :type => :request do
  describe "GET /announcements" do
    it "displays active announcements", js: true do
      Announcement.create! message: 'Hello World', starts_at: 1.hour.ago, ends_at: 1.hour.from_now
      Announcement.create! message: 'Upcoming', starts_at: 10.minutes.from_now, ends_at: 1.hour.from_now
      visit root_path

      expect(page).to have_content('Hello World')
      expect(page).not_to have_content('Upcoming')

      click_link 'Скрыть'
      expect(page).not_to have_content('Hello World')
    end

    it "hides announcement without reloading page", js: true do
      Announcement.create! message: 'Hello World', starts_at: 1.hour.ago, ends_at: 1.hour.from_now
      visit root_path
      expect(page).to have_content('Hello World')
      expect { click_on 'Скрыть' }.to_not change { page.response_headers }
      expect(page).not_to have_content('Hello World')
    end
  end
end
