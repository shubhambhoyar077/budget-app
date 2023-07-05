require 'rails_helper'

RSpec.describe "Groups", type: :request do
  before :each do
    @user = User.create(name: 'Test', email: 'test2@example.com', password: 'password')
    sign_in @user
  end
  describe "GET /index" do
    it "returns http success" do
      get "/groups"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      Group.create(author: @user, name: "test group", icon: "https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187_square.jpg")
      get group_path(Group.last)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST :create' do
    it 'creates a new group' do
      recipe_attributes = { name: 'test group', icon: "https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187_square.jpg"}

      post '/groups', params: { group: recipe_attributes }

      expect(response.status).to eq(302)
      expect(Group.last.name).to eq('test group')
      expect(Group.last.icon).to eq('https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187_square.jpg')
    end
  end

end
