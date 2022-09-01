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
    permitted = recipe_params
    @recipe = Recipe.new(user: current_user, name: permitted[:name], preparation_time: permitted[:preparation_time],
                         cooking_time: permitted[:cooking_time], description: permitted[:description],
                         public: permitted[:public])
    if @recipe.valid? && @recipe.save
      redirect_to recipes_path
    else
      render root_path
    end
  end

  def destroy
    redirect_to recipe_path if Recipe.destroy(params[:id])
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def add_food_view
    @recipe = Recipe.find(params[:recipe_id])
    render 'add_food'
  end

  def add_food
    @recipe = Recipe.find(params[:recipe_id])
    @food = Food.find(params[:food_id])
    @recipefood = RecipeFood.includes([:food]).new(quantity: params[:quantity], food: @food, recipe: @recipe)
    if @recipefood.save
      redirect_to recipe_path(id: @recipe.id)
    else
      print @recipefood
      render :new
    end
  end

  def remove_food
    @recipe = Recipe.find(params[:recipe_id])
    @food = RecipeFood.includes([:food]).find(params[:id])
    @recipe.recipe_foods.delete(@food)
    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
