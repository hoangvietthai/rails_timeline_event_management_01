class Event < ApplicationRecord
  has_many :user_events
  has_one :notification

  validates :description, presence: true
  validates :time_from, presence: true
  validates :time_to, presence: true
end
