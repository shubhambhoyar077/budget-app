require 'rails_helper'

RSpec.describe "Products", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/products/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/products/create"
      expect(response).to have_http_status(:success)
    end
  end

end
