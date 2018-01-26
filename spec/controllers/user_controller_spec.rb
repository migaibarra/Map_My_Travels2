require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    it 'returns 200 status' do
      get :new
      expect(response.status).to eq 200
    end
    it 'renders a new user form' do
      get :new
      expect(response).to render_template(:new)
    end
  end
end
