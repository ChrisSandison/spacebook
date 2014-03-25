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

  def self.province_count(province)
    Space.where(province: province).count
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

  def average_rating
    reviews = self.reviews
    return "-" if reviews.blank?
    rating_total = reviews.pluck(:rating).try(:sum).try(:to_f)
    return "-" if rating_total.blank?
    rating_count = reviews.count
    (rating_total / rating_count).round(2)
  end

  def recent_events_as_select
    events = past_events.map do |event|
      [event.name, event.id]
    end
    events ||= [[]]
    [["(Event Not Listed)", 0]] + events
  end

  def past_events
    events.where("takes_place_at < ?", Date.today)
  end

  def future_events
    events.where("takes_place_at > ?", Date.today)
  end
end
 