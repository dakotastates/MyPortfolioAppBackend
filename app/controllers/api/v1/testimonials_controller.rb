class Api::V1::TestimonialsController < ApplicationController
  skip_before_action :authorized, only: [:create, :show]
  before_action :find_testimonial, only:[:show, :update, :destroy]

  def index
    @testimonials = Testimonial.all
    # byebug
    render json: @testimonials
  end

  def show
      render json: @testimonial
  end

  def create
    @testimonial = Testimonial.create(testimonial_params)

    if @testimonial.valid?
      render json: { testimonial: TestimonialSerializer.new(@testimonial) }, status: :created
    else
      # render json: { error: 'failed to create user' }, status: :not_acceptable
      render json: { error: @testimonial.errors.full_messages }, status: :not_acceptable
    end
  end

  def update
    # byebug
    if @testimonial.update(testimonial_params)
      render json: @testimonial
    else
      render json:{errors: @testimonial.errors.full_messages}
    end
  end

  private

  def testimonial_params
    params.require(:testimonial).permit( :id, :text, :name)
  end

  def find_testimonial
    @testimonial = Testimonial.find_by_id(params[:id])
  end
end
