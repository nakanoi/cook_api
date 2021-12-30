class DailyRecipeMailer < ApplicationMailer
  def jobLogger
    Crono.logger.nil? ? Rails.logger : Crono.logger
  end

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
      jobLogger.info("Mail to #{user.email}: Has no food.")
      return
    end

    Ingredient.eager_load(:menu).where(
      name: @today_main_food.name
    ).sample(3).each do |ingredient|
      @recipes.push(ingredient.menu)
      History.create!(
        user: user,
        menu: ingredient.menu,
        food: @today_main_food.name,
        day: Date.today,
      )
    end

    jobLogger.info("Mail to #{user.email}: Today's food is #{@today_main_food.name}")
    mail to: user.email, subject: "今日の晩御飯のレシピ ~#{@today_main_food.name}~"
  end
end
