class Skill < ApplicationRecord
  belongs_to :user, inverse_of: :skills
end
