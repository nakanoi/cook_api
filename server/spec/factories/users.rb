FactoryBot.define do
  factory :user do
    name { "test_user" }
    email { "test_user@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end

  factory :samename_user, class: "User" do
    name { "test_user" }
    email { "test_user2@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end

  factory :sameemail_user, class: "User" do
    name { "test_user2" }
    email { "test_user@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end

  factory :second_user, class: "User" do
    name { "secode_test_user" }
    email { "second_test_user@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
