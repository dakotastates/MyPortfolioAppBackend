class User < ApplicationRecord

  has_secure_password
  validates :username, uniqueness: { case_sensitive: false }
  has_one :address, dependent: :destroy
  has_many :socials, dependent: :destroy
  has_one :resume, dependent: :destroy
  has_one :portfolio, dependent: :destroy
  has_many :testimonials, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :skills, dependent: :destroy
  has_many :works, dependent: :destroy
  has_many :educations, dependent: :destroy




  accepts_nested_attributes_for :address, :socials, :projects, :educations, :works, :skills, :testimonials

end
