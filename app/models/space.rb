class Space < ActiveRecord::Base

  has_many :reviews
  has_many :events

  validates :address, presence: true
  validates :city, presence: true
  validates :province, presence: true

  def province_name
    Region.where("country_id = ? AND region_code = ?", 1, self.province).first.try(:name)
  end

  def formatted_address
    "#{address}, #{city}, #{province}"
  end

  def formatted_website
    "http://#{website}"
  end
end
 