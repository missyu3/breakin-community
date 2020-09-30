class MessagesController < ApplicationController
  before_action :find_place, :find_messages, only: [:new, :create]

  def new
    @message = Message.new
    @user_place = UserPlace.new
    @user_places = UserPlace.all
  end

  def create
    @message = Message.new(params_message)
    @user = User.find_by(id: current_user.id)
    if @message.save
      ActionCable.server.broadcast 'message_channel', content: @message, user: @user
    else
      render :new
    end
  end

  private

  def params_message
    params.require(:message).permit(:text).merge(user_id: current_user.id, place_id: params[:place_id])
  end

  def find_place
    @place = Place.find(params[:place_id])
  end

  def find_messages
    @messages = @place.messages.includes(:user)
  end
end
