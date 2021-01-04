class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :image, :url, :category
end
