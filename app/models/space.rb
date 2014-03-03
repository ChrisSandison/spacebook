class Space < ActiveRecord::Base

  validates :contact_name, presence: true
  validates :contact_email, presence: true
  validates :contact_number, presence: true # add more validations to this
  
  serialize :content, Hash
end
 