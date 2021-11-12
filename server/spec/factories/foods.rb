FactoryBot.define do
  factory :tomato, class: "Food" do
    name { "トマト" }
    store { 2 }
    unit { "個" }
    ignore { false }
    association :user
  end

  factory :poke, class: "Food" do
    name { "豚肉" }
    store { 500 }
    unit { "g" }
    ignore { false }
    association :user
  end

  factory :milk, class: "Food" do
    name { "牛乳" }
    store { 500 }
    unit { "ml" }
    ignore { true }
    association :user
  end

  factory :solt, class: "Food" do
    name { "塩" }
    store { 50 }
    unit { "%" }
    ignore { true }
    association :user
  end

  factory :empty, class: "Food" do
    name { "空" }
    store { 0 }
    unit { "個" }
    ignore { false }
    association :user
  end

  factory :other_user_food, class: "Food" do
    name { "他のユーザーの食材" }
    store { 5 }
    unit { "個" }
    ignore { true }
    association :user, factory: :second_user
  end
end
