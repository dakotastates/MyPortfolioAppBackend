class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :occupation, :description, :image, :bio, :contactmessage, :email, :phone, :address, :website, :resumedownload, :socials, :projects, :educations, :works, :skills, :resume, :testimonials

has_many :socials
has_many :projects
has_many :educations
has_many :works
has_many :skills
has_many :testimonials
has_one :address
# has_one :resume

end
