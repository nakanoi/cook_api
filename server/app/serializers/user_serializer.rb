class UserSerializer < ActiveModel::Serializer
  attributes :status, :is_login, :message, :id, :name, :email, :foods, :histories

  def status
    @instance_options[:status]
  end

  def is_login
    @instance_options[:is_login]
  end

  def message
    @instance_options[:message]
  end

  has_many :foods, each_serializer: FoodSerializer
  has_many :histories, serializer: HistorySerializer do
    @object.histories.eager_load(:menu).where("day >= '#{Date.today - 7.days}'")
  end
end
