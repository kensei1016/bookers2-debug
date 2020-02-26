class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_channel"
    # stream_from "chat:message"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def post(data)
    Chat.create!(send_user_id: 1, recv_user_id: 2, room_id: 1, message: data['message'])
    ActionCable.server.broadcast 'chat_channel', message: data['message']
  end
end
