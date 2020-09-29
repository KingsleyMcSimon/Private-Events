class Invitation < ApplicationRecord
  belongs_to :user, class_name: "User", foreign_key: :user_event_id
  belongs_to :user_event, class_name: "Event"
end
