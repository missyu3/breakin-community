class PlacesController < ApplicationController
  before_action :find_place, only: [:show, :edit, :update, :destroy]
  before_action :move_to_session, only: [:new, :edit, :destroy]

  def index
    @places = Place.all
    @user_places = UserPlace.all
  end

  def new
    @place = Place.new
  end

  def create
    @user = current_user
    @place = @user.places.new(params_place)
    if @place.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @place.update(params_place)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @place = Place.find_by(id: params[:id])
    if @place.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def params_place
    params.require(:place).permit(:image, :name, :address, :remark, :price, user_ids: [])
  end

  def find_place
    @place = Place.find(params[:id])
  end

  def move_to_session
    redirect_to new_user_session_path unless user_signed_in?
  end
end
