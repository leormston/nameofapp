class ApplicationController < ActionController::Base
  def index
    @products = Product.all
    @posts = Post.all
    @users = User.all
  end
end
