class RecipesController < ApplicationController
  def index
    @user = User.first
    @recipes = Recipe.where(user: @user)
  end

  def show; end
end
