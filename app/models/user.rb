class User < ActiveRecord::Base

  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  validates_confirmation_of :password, if: lambda { |m| m.password.present? }

  before_save { self.email = email.downcase }

  has_secure_password
end
