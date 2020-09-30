class UserPlacesController < ApplicationController
  def create
    @place = Place.find_by(id: params[:user_place][:place_id])
    @user_place = UserPlace.new(params_user_place)
    @user_place.save
    redirect_to new_place_message_path(params[:user_place][:place_id])
  end

  def destroy
    @user_place = UserPlace.find_by(user_id: current_user.id, place_id: params[:id])
    @user_place.destroy
    redirect_to root_path
  end

  private

  def params_user_place
    params.require(:user_place).permit.merge(user_id: current_user.id, place_id: @place.id)
  end
end
