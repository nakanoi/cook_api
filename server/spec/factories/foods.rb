FactoryBot.define do
  factory :tomato, class: "Food" do
    name { "トマト" }
    store { 2 }
    unit { "個" }
    ignore { false }
    token { "gaiohfjlaihjfiwhjflalkvnls" }
    association :user
  end

  factory :poke, class: "Food" do
    name { "豚肉" }
    store { 500 }
    unit { "g" }
    ignore { false }
    token { "gedkogks;kjvgpoe;akgdgbgrdgr" }
    association :user
  end

  factory :milk, class: "Food" do
    name { "牛乳" }
    store { 500 }
    unit { "ml" }
    ignore { true }
    token { "egerojgv;lsajmgorejoaa" }
    association :user
  end

  factory :solt, class: "Food" do
    name { "塩" }
    store { 50 }
    unit { "%" }
    ignore { true }
    token { "gekngv;lsmgpoag4gmladsmvlka" }
    association :user
  end

  factory :empty, class: "Food" do
    name { "空" }
    store { 0 }
    unit { "個" }
    ignore { false }
    token { "dfaojgoiejflaejfloejglojdkgjf" }
    association :user
  end

  factory :other_user_food, class: "Food" do
    name { "他のユーザーの食材" }
    store { 5 }
    unit { "個" }
    ignore { true }
    token { "agojweflfowjFHIEJFLIALSGDRE" }
    association :user, factory: :second_user
  end
end
