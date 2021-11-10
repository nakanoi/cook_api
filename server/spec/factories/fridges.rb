FactoryBot.define do
  factory :fridge do
    association :user
  end

  factory :second_fridge, class: "Fridge" do
    association :user
  end

  factory :other_fridge, class: "Fridge" do
    association :user, factory: :second_user
  end
end
