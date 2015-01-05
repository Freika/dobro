require 'rails_helper'

describe "Periods", :type => :request do
  describe "GET /periods" do
    let(:user) { create(:user) }

    it "shows only last week's posts" do
      Timecop.freeze('2014-12-8'.to_datetime)
      sign_in_with(user.username, user.password)

      (5..9).each do |i|
        Post.create!(content: 'Lorem ipsum dolor sit amet, consectetur',
          created_at: "2014-12-0#{i}".to_datetime, status: 'daily', user: user)
      end
      visit last_week_path

      expect(page).to have_content('сегодня, 8 декабря')
      expect(page).to have_content('9 декабря 2014')
      expect(page).to have_content('Последняя неделя с сегодня, 8 декабря по 14 декабря 2014')
      expect(page).not_to have_content('5 декабря 2014')
      expect(page).not_to have_content('6 декабря 2014')
      expect(page).not_to have_content('7 декабря 2014')
    end

    it "shows only last month's posts" do
      Timecop.freeze('2014-12-6'.to_datetime)
      sign_in_with(user.username, user.password)

      (1..6).each do |i|
        Post.create!(content: 'Lorem ipsum dolor sit amet, consectetur',
          created_at: "2014-12-0#{i}".to_datetime, status: 'daily', user: user)
      end
      Post.create!(content: 'Lorem ipsum dolor sit amet, consectetur',
          created_at: "2014-12-07".to_datetime, status: 'weekly', user: user)

      visit last_month_path

      expect(page).to have_content('7 декабря 2014')
      expect(page).to have_content('Итоги последнего месяца с 1 декабря 2014 по 31 декабря 2014')
      # TODO: Добавить проверку на "неналичие тегов h2"
    end
  end
end
