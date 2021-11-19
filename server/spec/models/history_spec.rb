require 'rails_helper'

RSpec.describe History, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @second_user = FactoryBot.create(:second_user)
    @menu_tomato = FactoryBot.create(:menu1)
    @menu_poke = FactoryBot.create(:menu2)
    @history1 = FactoryBot.build(
      :history1,
      user: @user,
      menu: @menu_tomato,
    )
    @history2 = FactoryBot.build(
      :history2,
      user: @user,
      menu: @menu_poke,
    )
    @other_user_history = FactoryBot.build(
      :other_user_history,
      user: @second_user,
      menu: @menu_tomato,
    )
  end

  describe "History model" do
    context "create history model" do
      it "successfully created" do
        @history1.valid?
        expect(@history1).to be_valid
      end
    end

    context "create history with nil user" do
      it "User can't be blank error occurs" do
        @history1.user_id = nil
        @history1.valid?
        expect(@history1.errors.full_messages).to include(
          "User can't be blank"
        )
      end
    end

    context "create history with nil user" do
      it "Menu can't be blank error occurs" do
        @history1.menu_id = nil
        @history1.valid?
        expect(@history1.errors.full_messages).to include(
          "Menu can't be blank"
        )
      end
    end

    context "create history with nil user" do
      it "Food can't be blank error occurs" do
        @history1.food = nil
        @history1.valid?
        expect(@history1.errors.full_messages).to include(
          "Food can't be blank"
        )
      end
    end

    context "create history with nil user" do
      it "Day can't be blank error occurs" do
        @history1.day = nil
        @history1.valid?
        expect(@history1.errors.full_messages).to include(
          "Day can't be blank"
        )
      end
    end

    context "create history with nil user" do
      it "User must exist error occurs" do
        @history1.user_id = 100000000000000
        @history1.valid?
        expect(@history1.errors.full_messages).to include(
          "User must exist"
        )
      end
    end

    context "create history with nil user" do
      it "Menu must exist error occurs" do
        @history1.menu_id = 100000000000000
        @history1.valid?
        expect(@history1.errors.full_messages).to include(
          "Menu must exist"
        )
      end
    end
  end
end
