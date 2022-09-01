require 'rails_helper'

RSpec.describe RecipeFood, type: :system do
  describe 'validations' do
    before(:each) do
      RecipeFood.destroy_all
      Recipe.destroy_all
      Food.destroy_all
      User.destroy_all
      @first_user = User.create(name: 'Jhon', email: 'test@gmail.com', password: '123456', id: 1)
      @recipe = Recipe.create(name: 'First Recipe', preparation_time: 0.5, cooking_time: 1,
                              description: 'Description', user: @first_user, public: true)
      @first_food = Food.create(name: 'Comida', price: 1, measurement_unit: 'g', quantity: 1, user: @first_user)
      @recipe_food = RecipeFood.create(recipe: @recipe, food: @first_food, quantity: 1)
    end

    it 'needs quantity' do
      @recipe_food.quantity = nil
      expect(@recipe_food).to_not be_valid
    end

    it 'needs food_id' do
      @recipe_food.food_id = nil
      expect(@recipe_food).to_not be_valid
    end

    it 'Valid with all attributes' do
      expect(@recipe_food).to be_valid
    end

    it 'needs recipe_id' do
      @recipe_food.recipe_id = nil
      expect(@recipe_food).to_not be_valid
    end
  end
end
