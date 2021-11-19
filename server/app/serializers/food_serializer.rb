class FoodSerializer < ActiveModel::Serializer
  attributes :id, :name, :store, :unit, :ignore,
    :token, :user_id, :created_at, :updated_at, :status

  def status
    @instance_options[:status]
  end
end
