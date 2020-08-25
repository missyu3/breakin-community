class MessagesController < ApplicationController
  def new
    @message = Message.new
    @place = Place.find(params[:place_id])
    @messages = @place.messages
  end
end
