require 'rails_helper'

describe Announcement, :type => :model do
  it "has only current announcement displayed" do
    passed = Announcement.create! starts_at: 1.day.ago, ends_at: 1.hour.ago
    current = Announcement.create! starts_at: 1.hour.ago, ends_at: 1.day.from_now
    upcoming = Announcement.create! starts_at: 1.hour.from_now, ends_at: 1.day.from_now

    expect(Announcement.current).to eq([current])
  end

  it "does not include ids passed in to current" do
    current1 = Announcement.create! starts_at: 1.hour.ago, ends_at: 1.day.from_now
    current2 = Announcement.create! starts_at: 1.hour.ago, ends_at: 1.day.from_now
    expect(Announcement.current([current2.id])).to eq([current1])
  end

  it "includes current when nil is passed in" do
    current = Announcement.create! starts_at: 1.hour.ago, ends_at: 1.day.from_now
    expect(Announcement.current(nil)).to eq([current])
  end
end
