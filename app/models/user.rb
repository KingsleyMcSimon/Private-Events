class User < ApplicationRecord
  has_many :made_events, foreign_key: :creator_id, class_name: 'Event'
  has_many :invitations, foreign_key: :user_event_id
  has_many :attended_events, through: :invitations, source: :user_event
  validates :username, presence: true, uniqueness: true, length: { minimum: 6, maximum: 15 }
end
