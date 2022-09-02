require 'rails_helper'

RSpec.describe 'Describe Recipe', type: :feature do
  describe 'index page' do
    before(:all) do
      RecipeFood.destroy_all
      Recipe.destroy_all
      Food.destroy_all
      User.destroy_all
      @user = User.create(name: 'Jhon', email: 'test@gmail.com', password: 'password')
      visit('http://localhost:3000')
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      click_button 'Log in'
      sleep(0.5)
      visit('http://localhost:3000/recipes')
    end

    it 'needs New Recipe btn' do
      expect(page).to have_content('New Recipe')
    end
    it 'redirects to new recipe' do
      visit('http://localhost:3000')
      fill_in 'user_email', with: 'test@gmail.com'
      fill_in 'user_password', with: 'password'
      click_button 'Log in'
      sleep(0.5)
      visit('http://localhost:3000/recipes')
      click_link 'New Recipe'
      expect(page).to have_current_path('http://localhost:3000/recipes/new')
    end
    it 'render List of Recipes title' do
      visit('http://localhost:3000')
      fill_in 'user_email', with: 'test@gmail.com'
      fill_in 'user_password', with: 'password'
      click_button 'Log in'
      sleep(0.5)
      visit('http://localhost:3000/recipes')
      expect(page).to have_content('Recipes')
    end
    it 'needs a Sing out btn' do
      visit('http://localhost:3000')
      fill_in 'user_email', with: 'test@gmail.com'
      fill_in 'user_password', with: 'password'
      click_button 'Log in'
      sleep(0.5)
      visit('http://localhost:3000/recipes')
      expect(page).to have_content('Sing out')
    end
  end
end
