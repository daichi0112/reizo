class FoodsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_food, only: [:edit, :update, :destroy]
  before_action :move_to_root_path, only: :edit
  before_action :set_search, only: [:index, :search]


  def index
    @foods = Food.includes(:user).order('bb_date')
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

  def destroy
    @food.destroy
    redirect_to root_path
  end

  def search
  end

  private

  def food_params
    params.require(:food).permit(:name, :number, :unit_id, :bb_date, :category_id).merge(user_id: current_user.id)
  end

  def set_food
    @food = Food.find(params[:id])
  end

  def move_to_root_path
    @food = Food.find(params[:id])
    redirect_to root_path unless current_user.id == @food.user.id
  end

  def set_search
    @search = Food.ransack(params[:q])
    @search_foods = @search.result(distinct: true).includes(:user).order('bb_date')
  end

end
