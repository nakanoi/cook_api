require 'rails_helper'

RSpec.describe "Api::V1::Auth::Sessions", type: :request do
  before do
    @user = FactoryBot.create(:user)
    @user_headers = @user.create_new_auth_token
    @user_headers.store(
      "Content-Type", "application/json; charset=UTF-8"
    )
  end

  describe "GET /index" do
    context "get messages with valid headers" do
      it "get response with 200 status" do
        get "/api/v1/auth/sessions", headers: @user_headers
        expect(response.status).to eq(200)
        expect(JSON.parse(response.body)["status"]).to eq(200)
        expect(JSON.parse(response.body)["is_login"]).to eq(true)
      end
    end

    context "get messages with invalid headers" do
      it "get response with 401 status" do
        get "/api/v1/auth/sessions", headers: {}
        expect(response.status).to eq(200)
        expect(JSON.parse(response.body)["status"]).to eq(200)
        expect(JSON.parse(response.body)["is_login"]).to eq(false)
      end
    end
  end
end
