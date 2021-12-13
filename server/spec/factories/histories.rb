FactoryBot.define do
  factory :history1, class: "History" do
    association :user
    association :menu, factory: :menu1
    food { "トマト" }
    day { "2021-11-18" }
  end

  factory :history2, class: "History" do
    association :user
    association :menu, factory: :menu2
    food { "豚肉" }
    day { "2021-11-18" }
  end

  factory :other_user_history, class: "History" do
    association :user, factory: :second_user
    association :menu, factory: :menu1
    food { "トマト" }
    day { "2021-11-18" }
  end
end
