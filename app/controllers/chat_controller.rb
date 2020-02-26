class ChatController < ApplicationController
  def show
    @chats = Chat.all
  end
end
