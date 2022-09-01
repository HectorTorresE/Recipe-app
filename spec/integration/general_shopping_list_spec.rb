require 'rails_helper'

RSpec.describe 'General Shopping List', type: :feature do
  describe 'index page' do
    before(:all) do
      RecipeFood.destroy_all
      Recipe.destroy_all
      Food.destroy_all
      User.destroy_all
      @first_user = User.create(name: 'Jhon', email: 'test@gmail.com', password: 'password')
      @first_food = Food.create(name: 'food 1', measurement_unit: 'bag', price: 1, quantity: 3, user: @first_user)
      @recipe_food = Recipe.create(name: 'recipe', preparation_time: 0.5, cooking_time: 1, description: 'description', public: true,
                              user: @first_user)
      RecipeFood.create(quantity: 5, recipe: @recipe_food, food: @first_food)
      visit('http://localhost:3000')
      fill_in 'user_email', with: @first_user.email
      fill_in 'user_password', with: @first_user.password
      click_button 'Log in'
      sleep(0.5)
      visit('http://localhost:3000/shopping_list')
    end
    it 'Renders a Shopping List' do
      expect(page).to have_content('Shopping List')
    end

    it 'Ammount of food items to buy is 1' do
      visit('http://localhost:3000')
      fill_in 'user_email', with: @first_user.email
      fill_in 'user_password', with: @first_user.password
      click_button 'Log in'
      sleep(0.5)
      visit('http://localhost:3000/shopping_list')
      expect(page).to have_content('Amount of food items to buy:1')
    end

    it 'Total value of food is $2 ' do
      visit('http://localhost:3000')
      fill_in 'user_email', with: @first_user.email
      fill_in 'user_password', with: @first_user.password
      click_button 'Log in'
      sleep(0.5)
      visit('http://localhost:3000/shopping_list')
      expect(page).to have_content('Total value of food needed:$2')
    end

    it 'needs a food called food 1: ' do
      visit('http://localhost:3000')
      fill_in 'user_email', with: @first_user.email
      fill_in 'user_password', with: @first_user.password
      click_button 'Log in'
      sleep(0.5)
      visit('http://localhost:3000/shopping_list')
      expect(page).to have_content('food 1')
    end
  end
end