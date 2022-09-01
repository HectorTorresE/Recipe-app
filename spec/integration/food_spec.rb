require 'rails_helper'

RSpec.describe 'Food', type: :systeam do
  require 'rails_helper'
  describe 'index page' do
    before(:all) do
      RecipeFood.destroy_all
      Recipe.destroy_all
      Food.destroy_all
      User.destroy_all
      user = User.create(name: 'Jhon', email: 'test@gmail.com', password: 'password')
      visit('http://localhost:3000')
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Log in'
    end
    it 'needs a new Food btn' do
      expect(page).to have_content('New food')
    end
    it 'Render List of Foods' do
      visit('http://localhost:3000')
      fill_in 'user_email', with: 'test@gmail.com'
      fill_in 'user_password', with: 'password'
      click_button 'Log in'
      expect(page).to have_content('Foods')
    end
    it 'redirects to new food page' do
      visit('http://localhost:3000')
      fill_in 'user_email', with: 'test@gmail.com'
      fill_in 'user_password', with: 'password'
      click_button 'Log in'
      click_link 'New food'
      expect(page).to have_current_path('http://localhost:3000/foods/new')
    end
    it 'needs a sing out btn' do
      visit('http://localhost:3000')
      fill_in 'user_email', with: 'test@gmail.com'
      fill_in 'user_password', with: 'password'
      click_button 'Log in'
      expect(page).to have_content('Sing out')
    end
  end
end
