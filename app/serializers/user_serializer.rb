class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :occupation, :description, :image, :bio, :contactmessage, :email, :phone, :address, :website, :resumedownload, :socials, :projects, :educations, :works, :skills, :resume, :testimonials


end
