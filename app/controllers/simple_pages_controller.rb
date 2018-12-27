class SimplePagesController < ApplicationController
  def index
    @products = Product.limit(3)
  end
  def landing_page
    @products = Product.limit(3)
  end
end
