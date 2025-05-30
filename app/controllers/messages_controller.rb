class MessagesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
  end

  def show
  end

  def new
    @chats = Chat.all
    @users = User.all
  end

  def create
    if @message.save
      redirect_to messages_path, notice: "Message sent"
    else
      @chats = Chat.all
      @users = User.all
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @chats = Chat.all
    @users = User.all
  end

  def update
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
