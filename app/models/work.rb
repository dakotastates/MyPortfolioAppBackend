class Work < ApplicationRecord
  belongs_to :user, inverse_of: :works
end
