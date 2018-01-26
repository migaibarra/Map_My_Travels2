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

  describe "POST #create" do
    context "with valid attributes" do
      it 'saves the new user in the database' do
        expect { post :create, params: { user: { first_name: "Bob", last_name: "Jenkins", email: "bjenkins@example.com", password: "Pa$$w0rd" } } }
        .to change{ User.count }.by(1)
      end
      it 'redirects to another page (will eventually be the homepage)' do
        post :create, params: { user: { first_name: "Bob", last_name: "Jenkins", email: "bjenkins@example.com", password: "Pa$$w0rd" } }
        expect(response.status).to eq(302)
      end

    end
  end
end
