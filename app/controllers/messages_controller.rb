class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
    @chats = Chat.all
    @users = User.all
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to messages_path, notice: "Message sent"
    else
      @chats = Chat.all
      @users = User.all
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @message = Message.find(params[:id])
    @chats = Chat.all
    @users = User.all
  end

  def update
    @message = Message.find(params[:id])
    if @message.update(message_params)
      redirect_to @message, notice: "Message updated"
    else
      @chats = Chat.all
      @users = User.all
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:chat_id, :user_id, :body)
  end
end
