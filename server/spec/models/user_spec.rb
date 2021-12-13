require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @samename = FactoryBot.build(:samename_user)
    @sameemail = FactoryBot.build(:sameemail_user)
  end

  describe "User model" do
    context "create user model" do
      it "successfully created" do
        @user.valid?
        expect(@user).to be_valid
      end
    end

    context "create with null name" do
      it "name must exist error occurs" do
        @user.name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include(
          "Name can't be blank"
        )
      end
    end

    context "create with same name to other user" do
      it "name has already been taken error occurs" do
        @user.save
        @samename.valid?
        expect(@samename.errors.full_messages).to include(
          "Name has already been taken"
        )
      end
    end

    context "create with null email" do
      it "email must exist error occurs" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include(
          "Email can't be blank"
        )
      end
    end

    context "create with same email to other user" do
      it "email has already been taken error occurs" do
        @user.save
        @sameemail.valid?
        expect(@sameemail.errors.full_messages).to include(
          "Email has already been taken"
        )
      end
    end

    context "create with null password" do
      it "password must exist error occurs" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include(
          "Password can't be blank"
        )
      end
    end

    context "create with different password" do
      it "password must exist error occurs" do
        @user.password_confirmation = "different_password"
        @user.valid?
        expect(@user.errors.full_messages).to include(
          "Password confirmation doesn't match Password"
        )
      end
    end

    context "password encrypted" do
      it "password is encrypted" do
        expect(@user.encrypted_password).to_not eq "password"
      end
    end
  end
end
