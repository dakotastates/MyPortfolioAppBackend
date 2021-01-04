class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :occupation, :description, :bio, :contactmessage, :email, :phone, :website, :resumedownload, :works, :educations, :skills, :projects, :socials, :testimonials
end
