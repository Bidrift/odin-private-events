class Event < ApplicationRecord
    belongs_to :creator, class_name: 'User'

    validates :name , presence: true, length: { minimum: 3, maximum: 100 }
    validates :description, presence: true, length: { minimum: 10, maximum: 500 }
    validates :date, presence: true
    validates :location, presence: true, length: { minimum: 5, maximum: 200 }
    validates :creator, presence: true
    
    
end
