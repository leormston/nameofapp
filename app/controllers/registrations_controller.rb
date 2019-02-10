class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    super
    user = current_user
    @name = user.first_name
    @email = user.email
    UserMailer.signup_form(@email, @name).deliver_now
    ActionMailer::Base.mail(from: "l.e.ormston@gmail.com",
        to: @email,
        subject: "A warm welcome from GPU marketplace",
        body: "Welcome to GPU marketplace. Thank you for signing up #{@name}. We hope you have good time exploring the website").deliver_now
  end

  def update
    super
  end
end
