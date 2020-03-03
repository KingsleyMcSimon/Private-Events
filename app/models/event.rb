class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"
    has_many :invitations, foreign_key: "user_event_id"
    has_many :attendees, through: :invitations, source: :event_user
    
    validates :name, presence: true, uniqueness: true, length: { maximum: 30 }
    validates :description, presence: true, length: { maximum: 1000 }
    validates :date, presence: true
    validates :location, presence: true, length: { maximum: 255 }
end
