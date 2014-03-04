class Region < ActiveRecord::Base

  def self.provinces
    all.where(country_id: 1).map{ |r| [r.name, r.region_code]}
  end
end
