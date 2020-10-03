class Invitation < ApplicationRecord
  belongs_to :user, class_name: "User"
  belongs_to :user_event, class_name: "Event"
end
