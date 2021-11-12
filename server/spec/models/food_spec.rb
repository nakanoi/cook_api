require 'rails_helper'

RSpec.describe Food, type: :model do
  before do
    @tomato = FactoryBot.create(:tomato)
  end

  describe "Food model" do
    context "create food model" do
      it "successfully created" do
        @tomato.valid?
        expect(@tomato).to be_valid
      end
    end

    context "create food model with nil name" do
      it "Name can't be blank error occurs" do
        @tomato.name = nil
        @tomato.valid?
        expect(@tomato.errors.full_messages).to include(
          "Name can't be blank"
        )
      end
    end

    context "create food model with nil store" do
      it "Store can't be blank error occurs" do
        @tomato.store = nil
        @tomato.valid?
        expect(@tomato.errors.full_messages).to include(
          "Store can't be blank"
        )
      end
    end

    context "create food model with nil unit" do
      it "Unit can't be blank error occurs" do
        @tomato.unit = nil
        @tomato.valid?
        expect(@tomato.errors.full_messages).to include(
          "Unit can't be blank"
        )
      end
    end

    context "create food model with nil user" do
      it "User can't be blank error occurs" do
        @tomato.user_id = nil
        @tomato.valid?
        expect(@tomato.errors.full_messages).to include(
          "User can't be blank"
        )
      end
    end

    context "create food model with non exist user" do
      it "User must exist error occurs" do
        @tomato.user_id = 100000000000
        @tomato.valid?
        expect(@tomato.errors.full_messages).to include(
          "User must exist"
        )
      end
    end
  end
end
