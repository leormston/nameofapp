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
  end

  def update
    super
  end
end
