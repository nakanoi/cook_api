FactoryBot.define do
  factory :menu1, class: "Menu" do
    name { "トマト料理" }
    img { "tomato_large.png" }
    medium_img { "tomato_medium.png" }
    small_img { "tomato_small.png" }
    title { "トマト" }
    menu_id { 515 }
    content { "トマト料理の作り方" }
    url { "tomato.com" }
    poster { "User1" }
    indication { "約15分" }
    cost { "約500円" }
  end

  factory :menu2, class: "Menu" do
    name { "豚肉料理" }
    img { "poke_large.png" }
    medium_img { "poke_medium.png" }
    small_img { "poke_small.png" }
    title { "豚肉" }
    menu_id { 999999 }
    content { "豚肉料理の作り方" }
    url { "poke.com" }
    poster { "User2" }
    indication { "約15分" }
    cost { "約500円" }
  end
end
