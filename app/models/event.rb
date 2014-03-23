class Event < ActiveRecord::Base
  validates :name, presence: true
  validates :content, presence: true
  validates :takes_place_at, presence: true

end
