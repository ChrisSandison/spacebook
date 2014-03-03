class Space < ActiveRecord::Base

  validates :name, presence: true

  seralize :content, Hash
end
