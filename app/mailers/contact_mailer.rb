class ContactMailer < ApplicationMailer
  def contact_me(message)
    @message = message
    mail(to: 'joshmkuehn@gmail.com', subject: 'Contact From QnProjects')
  end
end
