class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :occupation, :description, :image, :bio, :contactmessage, :email, :phone, :website, :resumedownload
end
