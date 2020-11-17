class FoodsController < ApplicationController
  before_action :authenticate_user!

  def index
    @foods = Food.includes(:user).order("bb_date")
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :number, :unit_id, :bb_date, :category_id).merge(user_id: current_user.id)
  end
end
