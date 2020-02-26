class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(chat)
    # Do something later
    ActionCable.server.broadcast 'chat_channel', message: render_message(chat)
    # ActionCable.server.broadcast 'chat_channel', message: chat.message
  end

  private
  def render_message(chat)
    ApplicationController.renderer.render(partial: 'chat/chat', locals: { chat: chat })
  end
end
