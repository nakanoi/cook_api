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
end
