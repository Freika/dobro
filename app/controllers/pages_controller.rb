class PagesController < ApplicationController
  before_action :authenticate_user!, only: :inside

  def home
  end

  def inside
  end

  def changelog
    response = HTTParty.get("https://api.github.com/repos/Freika/dobro/commits")
    commits = {}
    response.each do |commit|
      commits[commit['commit']['author']['date']] = commit['commit']['message']
    end
    @commits = commits
  end

end
