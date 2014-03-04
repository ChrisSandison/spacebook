class Space < ActiveRecord::Base

  validates :address, presence: true
  validates :city, presence: true
  validates :province, presence: true

end
 