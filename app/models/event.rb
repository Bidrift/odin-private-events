class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"

    validates :name, presence: true, length: { minimum: 3, maximum: 100 }
    validates :description, presence: true, length: { minimum: 10, maximum: 500 }
    validates :time, comparison: { greater_than: DateTime.now, message: "cannot be in the past.", name: "Event" }
    validates :location, presence: true, length: { minimum: 5, maximum: 200 }
    validates :creator, presence: true

    scope :in_past, ->  {
        where(time: ...DateTime.now)
    }

    scope :in_future, ->  {
        where(time: DateTime.now...)
    }

    has_many :attendances, foreign_key: "attended_event_id"
    has_many :attendees, through: :attendances

    def is_in_future?
        time.present? && time > DateTime.now
    end
end
