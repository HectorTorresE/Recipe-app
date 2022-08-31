class RecipesController < ApplicationController
  def index
    @user = current_user
    @recipes = Recipe.where(user: @user)
  end

  def new
    @user = current_user
    @recipe = Recipe.new
  end

  def create
    permitted = params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
    @recipe = Recipe.new(user: current_user, name: permitted[:name], preparation_time: permitted[:preparation_time],
                         cooking_time: permitted[:cooking_time], description: permitted[:description],
                         public?: permitted[:public])
    if @recipe.valid? && @recipe.save
      redirect_to recipes_path
    else
      render root_path
    end
  end

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public?)
  end

  def show; end
end
