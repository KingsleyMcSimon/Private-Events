class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"
    has_many :invitations, foreign_key: "user_event.id"
    has_many :attendees, through: :invitations, source: :event_user
    
    validates :name, presence: true, uniqueness: true, length: { minimum: 10, maximum: 30 }
    validates :description, presence: true, length: {minimum: 100, maximum: 1000 }
    validates :date, presence: true
    validates :location, presence: true, length: { maximum: 255 }
    
    scope :upcoming, -> { where('date > ?', Date.today) }
    scope :previous, -> { where('date < ?', Date.today) }
end