class Event < ApplicationRecord
  has_many :user_events
  has_one :notification
  has_many :users, through: :user_events

  validates :description, presence: true
  validates :time_from, presence: true
  validates :time_to, presence: true

  def all_day_event?
    time_from == time_from.midnight && time_to == time_to.midnight
  end

  def get_notify_before
    self.time_from - Settings.later.hours
  end
end
