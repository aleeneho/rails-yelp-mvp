class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurants = Restaurant.find(params[:id])
  end

  def new
    @restaurants = Restaurant.new
  end

  def create
    restaurant = Restaurant.new(restaurant_params)
    if restaurant.save
      redirect_to restaurants_path
    end
  end

  def edit
    @restaurants = Restaurant.find(params[:id])
  end

  def update
    @restaurants = Restaurant.find(params[:id])
    @restaurants.update(restaurant_params)
    redirect_to restaurants_path(@restaurants)
  end
end

private

def restaurant_params
  params.require(:restaurant).permit(:name, :phone_number, :address, :category)
end
