class FoodsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_food, only: [:edit, :update]

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

  def edit
  end

  def update
    if @food.update(food_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :number, :unit_id, :bb_date, :category_id).merge(user_id: current_user.id)
  end

  def set_food
    @food = Food.find(params[:id])
  end
end
