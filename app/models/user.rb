class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true, length: { minimum: 6, maximum: 15 }
  has_many :events, foreign_key: :creator_id
  has_many :invitations, dependent: :destroy
  has_many :attend, through: :invitations, source: :event

  def already_attend?(event)
    event.atendees.include?(event.id)
  end
end
