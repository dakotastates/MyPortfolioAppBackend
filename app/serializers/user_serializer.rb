class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :occupation, :description, :image, :bio, :contactmessage, :email, :phone, :addresses, :website, :resumedownload, :socials
end
