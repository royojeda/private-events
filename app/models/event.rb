class Event < ApplicationRecord
  def self.past
    where("date < ?", Date.current)
  end

  def self.future
    where("date >= ?", Date.current)
  end

  belongs_to :creator, class_name: "User"

  has_many :attendances, foreign_key: :attended_event_id,
                         inverse_of: :attended_event
  has_many :attendees, through: :attendances
end
