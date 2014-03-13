class ContactForm
  include ActiveModel::Model
  include ActionView::Helpers::FormOptionsHelper
  attr_accessor :reply_email, :email_message, :space

  def initialize(options = {})
    options.each do |key, value|
      self.send("#{key}=", value) if self.respond_to?(key)
    end
  end

  def submit(options = {})
    # SpaceMailer.contact_space(space: self.space, reply_email: self.reply_email, email_message: self.email_message)
  end
end