class Space < ActiveRecord::Base

  has_many :reviews
  has_many :events

  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :province, presence: true

  def self.alert_messages
    {
      "sent_email" => "Email has been sent!",
      "new_event" => "Event has been created!",
      "new_review" => "Review has been created!",
      "updated" => "Space info updated!"
    }
  end

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
 