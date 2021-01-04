class Api::V1::TestimonialsController < ApplicationController
  skip_before_action :authorized, only: [:index, :create, :show, :update]
  before_action :find_testimonial, only:[:show, :update, :destroy]

  def index
    @testimonials = Testimonial.all
    render json: @testimonials
  end

  private

  def testimonial_params
    # params { user: {username: 'Chandler Bing', password: 'hi' } }
    params.require(:testimonial).permit(:name)
  end

  def find_testimonial
    @testimonial = Testimonial.find_by_id(params[:id])
  end
end
