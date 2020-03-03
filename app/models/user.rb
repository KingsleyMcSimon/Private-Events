class User < ApplicationRecord
    has_many :events, foreign_key: :creator_id, class_name: 'Event'
    has_many :invitations, foreign_key: :event_user_id
    validates :username, presence: true, uniqueness: false , length: { maximum: 20 }
end
