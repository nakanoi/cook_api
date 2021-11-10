require 'rails_helper'

RSpec.describe "Api::V1::Fridges", type: :request do
  before do
    @user = FactoryBot.create(:user)
    @second_user = FactoryBot.create(:second_user)
    @user_headers = @user.create_new_auth_token
    @user_headers.store(
      "Content-Type", "application/json; charset=UTF-8"
    )
    @fridge = FactoryBot.create(:fridge, user: @user)
    @second_fridge = FactoryBot.create(
      :second_fridge,
      user: @user
    )
    @other_fridge = FactoryBot.create(
      :other_fridge,
      user: @second_user,
    )
  end

  describe "GET /api/v1/fridges" do
    context "get all fridges user has" do
      it "get 200 response" do
        get "/api/v1/fridges", headers: @user_headers
        expect(response.status).to eq(200)
        expect(JSON.parse(response.body).size).to eq(2)
      end
    end

    context "get all fridges user has with invalid user" do
      it "get 401 response" do
        get "/api/v1/fridges", headers: {}
        expect(response.status).to eq(401)
      end
    end
  end

  describe "GET /api/v1/fridges/{ID}" do
    context "get first fridge user has" do
      it "get 200 response with one fridge" do
        get "/api/v1/fridges/#{@fridge.id}",
          headers: @user_headers
        expect(response.status).to eq(200)
        expect(JSON.parse(response.body)["status"]).to eq(200)
        expect(JSON.parse(response.body)["fridge"]).not_to eq(nil)
      end
    end

    context "get first fridge user has" do
      it "get 200 response with 0 fridge" do
        get "/api/v1/fridges/#{@other_fridge.id}",
          headers: @user_headers
        expect(response.status).to eq(200)
        expect(JSON.parse(response.body)["status"]).to eq(404)
        expect(JSON.parse(response.body)["fridge"]).to eq(nil)
      end
    end

    context "get first fridge user has with invalid user" do
      it "get 401 response" do
        get "/api/v1/fridges", headers: {}
        expect(response.status).to eq(401)
      end
    end
  end

  describe "POST /api/v1/friges" do
    context "create fridge with valid params" do
      it "get 200 response" do
        post "/api/v1/fridges", headers: @user_headers
        expect(response.status).to eq(200)
        expect(JSON.parse(response.body)["status"]).to eq(200)
      end
    end

    context "create fridge with invalid params" do
      it "get 401 response" do
        post "/api/v1/fridges", headers: {}
        expect(response.status).to eq(401)
      end
    end
  end
end
