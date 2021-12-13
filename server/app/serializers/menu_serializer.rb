class MenuSerializer < ActiveModel::Serializer
  attributes :name, :img, :medium_img, :small_img, :indication
  attributes :title, :menu_id, :content, :url, :poster, :cost

end
