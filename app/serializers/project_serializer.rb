class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :category, :image, :url
end
