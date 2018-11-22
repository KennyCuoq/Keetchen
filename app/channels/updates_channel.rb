class UpdatesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "update_channel_#{params[:user_id]}"
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
