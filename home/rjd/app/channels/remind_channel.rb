class RemindChannel < ApplicationCable::Channel
  def subscribed
     stream_from "remind_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
  end
end
