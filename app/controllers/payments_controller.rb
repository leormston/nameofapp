class PaymentsController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = current_user
    @orders = Order.where(user_id: @user.email)
    @products = Product.all
  end

  def create
    @product = Product.find(params[:product_id])
    token = params[:stripeToken]
    # Create the charge on Stripe's servers - this will charge the user's card
    price = @product.avgprice.to_i*100
    @user = current_user
    begin
      charge = Stripe::Charge.create(
        amount: price,
        currency: "gbp",
        source: token,
        description: params[:stripeEmail],
        reciept_email: @user.email
      )

      if charge.paid
        Order.create(product_id: @product.id, user_id: @user.email, total: price)
      end
    rescue Stripe::CardError => e
      #The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end
    redirect_to(payments_show_path)
  end
end
