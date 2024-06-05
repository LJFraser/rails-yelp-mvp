class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[ show edit update destroy ]
  def index
    # to see this page go to /restaurants
    @restaurants = Restaurant.all
  end

  def show
    # here we will have the path /restaurant/id - defined by before action
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to @restaurant, notice: "Restaurant was successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to restaurants_url, notice: "Restaurant was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_url, notice: "Restaurant was successfully deleted."
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
