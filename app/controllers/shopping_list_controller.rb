require_relative '../models/shopping_list_item'

class ShoppingListController < ApplicationController
  def index
    @shoppings = []
    @recipes = Receipt.all
    @recipes.each do |recipe|
      recipe.recipe_foods.includes([:food]).each do |recipe_food|
        if recipe_food.quantity > recipe_food.food.quantity
          shopping_item = ShoppingItem.new(recipe_food.food, recipe_food.quantity - recipe_food.food.quantity)
          @shoppings << shopping_item
        end
      end
    end

    @total_price = @shoppings.inject(0) do |sum, shopping_list_item|
      sum + (shopping_list_item.food.price * shopping_list_item.required_quantity)
    end
  end
end