class UserPlacesController < ApplicationController

  def create
    @place = Place.find_by(id: params[:user_place][:place_id])
    @user_place = UserPlace.new(params_user_place)
    if @user_place.save
      redirect_to  new_place_message_path(params[:user_place][:place_id])
    else      
      redirect_to  new_place_message_path(params[:user_place][:place_id])
    end
    
  end
  
  private
  def params_user_place
    # @place = Place.find_by(id: params[:user_place][:place_id])
    params.require(:user_place).permit.merge(user_id: current_user.id, place_id: @place.id)
  end
end
