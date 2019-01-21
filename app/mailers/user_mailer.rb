class UserMailer < ApplicationMailer
  default from: 'l.e.ormston@gmail.com'

  def contact_form(email, name, message)
  @message = message
    mail(from: email,
         to: 'l.e.ormston@gmail.com',
         subject: "A new contact form message from #{name}")
  end

  def signup_form(email, name)
      mail(from: 'l.e.ormston@gmail.com',
           to: email,
           subject: "Welcome to GPU marketlpace #{name}")
  end

end
