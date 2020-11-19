class Resume < ApplicationRecord
  belongs_to :user
  has_many :educations
  has_many :works
  has_many :skills

  accepts_nested_attributes_for :educations, :works, :skills

end
