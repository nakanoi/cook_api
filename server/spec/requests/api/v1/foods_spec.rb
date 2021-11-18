require 'rails_helper'

RSpec.describe "Api::V1::Foods", type: :request do
  before do
    @user = FactoryBot.create(:user)
    @second_user = FactoryBot.create(:second_user)
    @user_headers = @user.create_new_auth_token
    @user_headers.store(
      "Content-Type", "application/json; charset=UTF-8"
    )
    @tomato = FactoryBot.build(:tomato, user: @user)
    @poke = FactoryBot.build(:poke, user: @user,)
    @milk = FactoryBot.build(:milk, user: @user)
    @solt = FactoryBot.build(:solt, user: @user)
    @empty = FactoryBot.build(:empty, user: @user)
    @other = FactoryBot.build(
      :other_user_food,
      user: @second_user,
    )
    @foods = [@tomato, @poke, @milk, @solt]
    @params = {attributes: []}
  end

  describe "GET /api/v1/foods" do
    context "all foods with valid headers" do
      it "get 200 status with 5 foods" do
        @tomato.save
        @poke.save
        @milk.save
        @solt.save
        @empty.save
        @other.save
        get "/api/v1/foods", headers: @user_headers
        expect(response.status).to eq(200)
        expect(JSON.parse(response.body).size).to eq(5)
      end
    end

    context "all foods with invalid headers" do
      it "get 401 status" do
        @tomato.save
        @poke.save
        @milk.save
        @solt.save
        @empty.save
        @other.save
        get "/api/v1/foods", headers: {}
        expect(response.status).to eq(401)
      end
    end
  end

  describe "GET /api/v1/foods/{ID}" do
    context "get @tomato with valid headers" do
      it "get 200 status with @tomato json" do
        @tomato.save
        @poke.save
        @milk.save
        @solt.save
        @empty.save
        @other.save
        get "/api/v1/foods/#{@tomato.id}",
          headers: @user_headers
        expect(response.status).to eq(200)
        expect(JSON.parse(response.body)["status"]).to eq(200)
        expect(JSON.parse(response.body)["food"]["id"]).to eq(@tomato.id)
      end
    end

    context "get @tomato with invalid headers" do
      it "get 401 status" do
        @tomato.save
        @poke.save
        @milk.save
        @solt.save
        @empty.save
        @other.save
        get "/api/v1/foods/#{@tomato.id}", headers: {}
        expect(response.status).to eq(401)
      end
    end

    context "get @other with valid headers" do
      it "get 200 status with 404 status body" do
        @tomato.save
        @poke.save
        @milk.save
        @solt.save
        @empty.save
        @other.save
        get "/api/v1/foods/#{@other.id}",
          headers: @user_headers
        expect(response.status).to eq(200)
        expect(JSON.parse(response.body)["status"]).to eq(404)
      end
    end
  end

  describe "POST /api/v1/foods" do
    context "only create new foods with valid params" do
      it "get 200 status with 4 creates" do
        for food in @foods
          @params[:attributes].push({
            name: food.name,
            store: food.store,
            unit: food.unit,
            ignore: food.ignore,
            token: food.token,
            user_id: @user.id,
            created_at: Time.now,
            updated_at: Time.now,
          })
        end
        post "/api/v1/foods",
          params: @params.to_json,
          headers: @user_headers
        expect(response.status).to eq(200)
        expect(
          JSON.parse(
            response.body
          )["attributes"].size
        ).to eq(4)
      end
    end

    context "only update foods with valid params" do
      it "get 200 status with 4 updates" do
        @tomato.save
        @poke.save
        @milk.save
        @solt.save
        @empty.save
        for food in @foods
          @params[:attributes].push({
            name: food.name,
            store: food.store,
            unit: food.unit,
            ignore: food.ignore,
            token: food.token,
            user_id: @user.id,
            created_at: food.created_at,
            updated_at: Time.now,
          })
        end
        post "/api/v1/foods",
          params: @params.to_json,
          headers: @user_headers
        expect(response.status).to eq(200)
        expect(
          JSON.parse(
            response.body
          )["attributes"].size
        ).to eq(4)
      end
    end

    context "update and create foods with valid params" do
      it "get 200 status with a update, 3 creates" do
        @tomato.save
        @poke.save
        @milk.save
        for food in @foods
          created_at = food.created_at.nil? ? Time.now : food.created_at
          @params[:attributes].push({
            name: food.name,
            store: food.store,
            unit: food.unit,
            ignore: food.ignore,
            token: food.token,
            user_id: @user.id,
            created_at: created_at,
            updated_at: Time.now,
          })
        end
        post "/api/v1/foods",
          params: @params.to_json,
          headers: @user_headers
        expect(response.status).to eq(200)
        expect(
          JSON.parse(
            response.body
          )["attributes"].size
        ).to eq(4)
      end
    end

    context "update food which belongs to other user" do
      it "get 400 response" do
        @tomato.save
        @poke.save
        @milk.save
        @solt.save
        @empty.save
        @other.save
        for food in @foods.push(@other)
          if food.created_at
            created_at = food.created_at
          else
            created_at = Time.now
          end
          @params[:attributes].push({
            name: food.name,
            store: food.store,
            unit: food.unit,
            ignore: food.ignore,
            token: food.token,
            user_id: @user.id,
            created_at: created_at,
            updated_at: Time.now,
          })
        end
        post "/api/v1/foods",
          params: @params.to_json,
          headers: @user_headers
        expect(response.status).to eq(200)
        expect(JSON.parse(response.body)["status"]).to eq(400)
      end
    end
  end
end
