class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable
  has_many :user_events, dependent: :destroy
  has_many :events, through: :user_events, dependent: :destroy

  accepts_nested_attributes_for :events

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    length: {maximum: Settings.max1},
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false}
  validates :password, presence: true,
    length: {minimum: Settings.min1}, allow_nil: true
  enum role: {admin: 0, leader: 1, user: 2}

  def count_notification
    events.count{|i| i.time_from > Time.now}
  end

  def event_deadline
    (events.select{|e| e.time_from < Time.now}).sort_by{|t| t[:time_from]}
  end

  def event_dontdeadline
    (events.select{|e| e.time_from >= Time.now}).sort_by{|t| t[:time_from]}
  end

  def get_notis
    event_dontdeadline.map{|ev| ev.notification.id}
  end

  def get_notied
    event_deadline.map{|ev| ev.notification.id}
  end

  def send_mail_notification event
    UserMailer.post_notice(self, event).deliver_later! wait_until:
      event.time_from - event.notification.notify_before.hours
  end
end
