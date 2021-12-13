require 'rails_helper'

RSpec.describe "Api::V1::Auth::Registrations", type: :request do
  before do
    @user = FactoryBot.build(:user)
    @signup_params = {
      name: "test_user",
      email: "test_user@example.com",
      password: "password",
      password_confirmation: "password",
    }
    @signin_params = {
      email: "test_user@example.com",
      password: "password",
    }
    @nonexist_email = {
      email: "nonexist_testuser@example.com",
      password: "password",
    }
    @invalid_password = {
      email: "testuser@example.com",
      password: "invalid_password",
    }
  end

  describe "POST /api/v1/auth" do
    context "sign up with valid params" do
      it "get success response" do
        post "/api/v1/auth",
          params: @signup_params,
          headers: @headers
        expect(response.status).to eq(200)
      end
    end

    context "sign in with valid params" do
      it "get success response" do
        @user.save
        post "/api/v1/auth/sign_in", params: @signin_params
        expect(response.status).to eq(200)
      end
    end

    context "sign in with nonexist email params" do
      it "get 401 response" do
        post "/api/v1/auth/sign_in", params: @nonexist_email
        expect(response.status).to eq(401)
      end
    end

    context "sign in with invalid password params" do
      it "get 401 response" do
        post "/api/v1/auth/sign_in", params: @invalid_password
        expect(response.status).to eq(401)
      end
    end
  end
end
