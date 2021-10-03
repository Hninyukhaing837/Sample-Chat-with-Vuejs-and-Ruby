class MessagesController < ApplicationController
  def index
    messages = Message.all
    render json: messages
  end  

  def create
    message = Message.new(message_params)
    if message.save
      render json: message, status: :created
    else
      render json: { errors: message.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def message_params
    params.fetch(:message, {}).permit(:id, :user_id, :content)
  end
end
