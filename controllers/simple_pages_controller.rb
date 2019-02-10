class SimplePagesController < ApplicationController
  def index
    @products = Product.limit(8)
  end
  def landing_page
    @products = Product.limit(8)
  end
  def admin
    @products = Product.all
  end
  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    UserMailer.contact_form(@email, @name, @message).deliver_now
    ActionMailer::Base.mail(from: @email,
        to: 'your-email@example.com',
        subject: "A new contact form message from #{@name}",
        body: @message).deliver_now
  end
end
