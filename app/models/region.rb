class Region < ActiveRecord::Base

  def self.provinces
    all.where(country_id: 1).map{ |r| [r.name, r.region_code]}
  end

  def self.exists?(province)
    Region.where("country_id = ? AND (name = ? OR region_code = ?)", 1, province, province).present?
  end

  def self.get_region_code_from_name(province_name)
    Region.where("country_id = ? AND name = ?", 1, province_name).first.region_code
    end
end
