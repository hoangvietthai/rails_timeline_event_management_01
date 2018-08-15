class Event < ApplicationRecord
  has_many :user_events, dependent: :destroy
  has_one :notification, dependent: :destroy
  has_many :users, through: :user_events, dependent: :destroy
  accepts_nested_attributes_for :notification

  validates :description, presence: true
  validates :time_from, presence: true
  validates :time_to, presence: true
  validate :time_from_cannot_bigger_than_time_to

  def time_from_cannot_bigger_than_time_to
    return if time_from < time_to
    errors.add :time_from, I18n.t("time_validate")
  end

  def all_day_event?
    time_from == time_from.midnight && time_to == time_to.midnight
  end
end
