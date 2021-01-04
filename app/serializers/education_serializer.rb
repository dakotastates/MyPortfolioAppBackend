class EducationSerializer < ActiveModel::Serializer
  attributes :id, :school, :degree, :graduated, :description
end
