class Education < ApplicationRecord
  belongs_to :user, inverse_of: :educations
end
