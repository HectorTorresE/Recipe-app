require 'rails_helper'

RSpec.describe 'PublicRecepies', type: :request do
  describe 'GET /show' do
    it 'returns http success' do
      get '/public_recepies/show'
      expect(response).to have_http_status(:success)
    end
  end
end
