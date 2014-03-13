class SpaceMailer < ActionMailer::Base
  default from: "no-reply@spacebook.com"

  def contact_space(options = {})
    @space = options[:space]
    @reply_email = options[:reply_email]
    @message = options[:email_message]

    mail(to: @space.contact_email, subject: "Message regarding #{@space.name}")
  end
end
