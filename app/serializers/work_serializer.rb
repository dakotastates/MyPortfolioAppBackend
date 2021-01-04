class WorkSerializer < ActiveModel::Serializer
  attributes :id, :company, :title, :years, :description
end
