class Event < ApplicationRecord
  has_many :user_events
  has_one :notification
end
