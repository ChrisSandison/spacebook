class Review < ActiveRecord::Base
  belongs_to :space

  validates :created_by_name, presence: true
  validates :content, presence: true
end
