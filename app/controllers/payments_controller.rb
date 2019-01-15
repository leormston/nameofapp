class PaymentsController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = current_user
    @orders = Order.where(user_id: @user.id)
    @products = Product.all
  end

  def create
    @product = Product.find(params[:product_id])
    token = params[:stripeToken]
    # Create the charge on Stripe's servers - this will charge the user's card
    price = @product.avgprice.to_i
    logger.debug "Price before calculation : #{price}"
    price = @product.avgprice.to_i*100
    logger.debug "Price after calculation : #{price}"
    @user = current_user
    begin
      charge = Stripe::Charge.create(
        amount: price,
        currency: "gbp",
        source: token,
        description: params[:stripeEmail],
        receipt_email: @user.email
      )

      if charge.paid
        x = Order.create(product_id: @product.id, user_id: @user.id, total: price)
        redirect_to(payments_show_path)
        flash[:notice] = "Payment Succesful"
        flash[:success] = "Order (Number #{x.id}) is being processed and dealt with"

      end
    rescue Stripe::CardError => e
      #The card has been declined
      redirect_to(payments_show_path)
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end


  end
end
