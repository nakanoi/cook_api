require 'rails_helper'

RSpec.describe Fridge, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @fridge = FactoryBot.create(:fridge)
  end

  describe "Fridge model" do
    context "create fridge model" do
      it "successfully created" do
        @user.save
        @fridge.valid?
        expect(@fridge).to be_valid
      end
    end

    context "create fridge with nil user" do
      it "User can't be blank error occurs" do
        @user.save
        @fridge.user_id = nil
        @fridge.valid?
        expect(@fridge.errors.full_messages).to include(
          "User can't be blank"
        )
      end
    end

    context "create fridge with non exist user" do
      it "User must exist error occurs" do
        @user.save
        @fridge.user_id = 10000000000000
        @fridge.valid?
        expect(@fridge.errors.full_messages).to include(
          "User must exist"
        )
      end
    end
  end
end
