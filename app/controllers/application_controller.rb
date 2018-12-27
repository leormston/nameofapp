class ApplicationController < ActionController::Base
  def index
    @products = Product.all
    @posts = Post.all
  end
end
