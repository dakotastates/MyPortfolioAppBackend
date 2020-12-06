class Project < ApplicationRecord
  belongs_to :user, inverse_of: :projects
end
