class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    super
    user = current_user
  end

  def update
    super
  end
end
