class HistorySerializer < ActiveModel::Serializer
  attributes :id, :food, :day, :user, :menu, :user_id

  belongs_to :menu, serializer: MenuSerializer
end
