class Resume < ApplicationRecord
  belongs_to :user
  has_many :educations
  has_many :works
  has_many :skills
end
