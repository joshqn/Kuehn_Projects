class ContactMailer < ApplicationMailer
  def contact_me(message)
    @message = message
    mail(to: @message.email, subject: 'Contact From QnProjects')
  end
end
