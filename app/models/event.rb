class Event < ApplicationRecord
  belongs_to :creator, foreign_key: 'creator_id', class_name: 'User'
  has_many :attendances, foreign_key: 'attended_event_id'
  has_many :attendees, through: :attendances

  validates :title, presence: true, length: { minimum: 2 }
  validates :description, presence: true, length: { in: 5..100 }
end
