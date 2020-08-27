class MessagesController < ApplicationController
  def new
    @message = Message.new
    @place = Place.find(params[:place_id])
    @messages = @place.messages.all
    @user = User.find_by(id: current_user.id)
    @user_place = UserPlace.new
    @user_places = UserPlace.all
  end

  def create
    @place = Place.find(params[:place_id])
    @message = Message.new(params_message)
    @messages = @place.messages.includes(:user)
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

  
end
