class PlacesController < ApplicationController
  def index
    @places = Place.all
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(params_place)
    if @place.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @place = Place.find(params[:id])
  end
  
  def edit
    @place = Place.find(params[:id])
  end
  
  
  def update
    @place = Place.find(params[:id])
    if @place.update(params_place)
      redirect_to root_path
    else
      render :edit
    end
  end


  private
  def params_place
    params.require(:place).permit(:name, :address, :main_time, :available_time, :price)
  end
  
end
