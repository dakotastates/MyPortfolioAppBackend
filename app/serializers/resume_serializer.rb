class ResumeSerializer < ActiveModel::Serializer
  attributes :id, :skillmessage, :educations, :works, :skills
end
