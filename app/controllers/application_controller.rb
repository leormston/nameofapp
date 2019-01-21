class ApplicationController < ActionController::Base

  def index
    @products = Product.all
    @posts = Post.all
    @users = User.all
    @comments= Comment.all
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name,:last_name,:email, :password, :password_confirmation) }
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name,:last_name,:email, :password, :password_confirmation) }
    end
end
