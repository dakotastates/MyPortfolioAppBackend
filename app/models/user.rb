class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: { case_sensitive: false }
  has_many :addresses, dependent: :destroy
  has_many :socials, dependent: :destroy
  has_many :resumes, dependent: :destroy


end
