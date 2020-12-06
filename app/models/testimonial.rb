class Testimonial < ApplicationRecord
  belongs_to :user, inverse_of: :testimonials

end
