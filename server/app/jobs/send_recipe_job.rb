class SendRecipeJob < ApplicationJob
  queue_as :default

  def perform(*args)
    jobLogger.info "Send Mail on #{Date.today.strftime("%Y-%m-%d")} Started."
    User.all.each do |user|
      DailyRecipeMailer.send_recipe_to_user(user).deliver_now
    end
  end
end
