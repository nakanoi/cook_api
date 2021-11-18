class DailyRecipeMailer < ApplicationMailer
  def send_recipe_to_user(user)
    @user = user
    selection = []

    user.foods.each do |food|
      if food.store > 0 and not food.ignore
        selection.push(food)
      end
    end

    @today_main_food = selection.sample
    @recipes = []

    if @today_main_food.nil?
      return
    end

    Ingredient.where(
      name: @today_main_food.name
    ).sample(3).each do |ingredient|
      @recipes.push(ingredient.menu)
    end

    mail to: user.email, subject: "今日の晩御飯のレシピ ~#{@today_main_food.name}~"
  end

  def send_recipe_to_all_users
    User.all.each do |user|
      send_recipe_to_user(user)
    end
  end

end