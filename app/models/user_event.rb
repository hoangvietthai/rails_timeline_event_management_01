class UserEvent < ApplicationRecord
  belongs_to :event
  belongs_to :user

  class << self
    def is_invited_mem? event_id, user_id
      return UserEvent.find_by(event_id: event_id,
        user_id: user_id).permission.zero?
    end
  end
end
