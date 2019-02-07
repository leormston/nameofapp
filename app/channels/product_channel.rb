class ProductChannel < ApplicationCable::Channel
  def subscribed
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def listen
    stop_all_streams
    stream_for data["product_id"]
  end
end
