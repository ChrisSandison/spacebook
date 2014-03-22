class Review < ActiveRecord::Base
  belongs_to :space

  validates :created_by_name, presence: true
  validates :content, presence: true
  validates :rating, presence: true
  validates :event_id, presence: true
  
  def space_rating(space_id)
    @space = Space.find(space_id)
    @space.average_rating
  end

  def rating=(val)
    write_attribute :rating, val.to_s.gsub(/\D/, '').to_i
  end
end
