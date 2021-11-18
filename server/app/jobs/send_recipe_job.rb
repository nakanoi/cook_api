class SendRecipeJob < ApplicationJob
  queue_as :default

  def perform(*args)
    jobLogger.info "Send Mail on #{Date.today.strftime("%Y-%m-%d")} Started."
    DailyRecipeMailer.send_recipe_to_all_users.deliver
  end
end
