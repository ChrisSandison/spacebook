class User < ActiveRecord::Base

  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  validates_confirmation_of :password, if: lambda { |m| m.password.present? }

  before_create :create_remember_token
  before_save { self.email = email.downcase }

  has_secure_password

  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.hash(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = self.hash(self.new_remember_token)
    end

end
