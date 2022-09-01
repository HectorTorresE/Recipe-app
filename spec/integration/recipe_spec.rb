require 'rails_helper'

RSpec.describe Recipe, type: :system do
  before(:each) do
    RecipeFood.destroy_all
    Recipe.destroy_all
    Food.destroy_all
    User.destroy_all
    @first_user = User.create(name: 'Jhon', email: 'test@gmail.com', password: '123456', id: 1)
    @recipe = Recipe.create(name: 'First Recipe', preparation_time: 0.5, cooking_time: 1,
                            description: 'Description', user: @first_user, public: true)
  end

  it 'Valid with all attributes' do
    expect(@recipe).to be_valid
  end

  it 'needs a user_id' do
    @recipe.user_id = nil
    expect(@recipe).to_not be_valid
  end

  it 'needs a name' do
    @recipe.name = nil
    expect(@recipe).to_not be_valid
  end

  it 'needs cooking_time' do
    @recipe.cooking_time = nil
    expect(@recipe).to_not be_valid
  end

  it 'needs preparation_time' do
    @recipe.preparation_time = nil
    expect(@recipe).to_not be_valid
  end

  it 'needs description' do
    @recipe.description = nil
    expect(@recipe).to_not be_valid
  end
end
