class Social < ApplicationRecord
  belongs_to :user, inverse_of: :socials
end
