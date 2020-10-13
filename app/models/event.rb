class Event < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { maximum: 300 }
  validates :description, presence: true, length: { maximum: 1000 }
  # validates :date, presence: true
  validates :location, presence: true, length: { maximum: 255 }
  belongs_to :creator, class_name: 'User'
  has_many :invitations, dependent: :destroy
  has_many :atendees, through: :invitations, source: :user

  scope :upcoming, -> { where('date > ?', Time.now) }
  scope :previous, -> { where('date < ?', Time.now) }
end
