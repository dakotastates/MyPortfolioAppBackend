class Api::V1::EducationsController < ApplicationController
  skip_before_action :authorized, only: [:create, :update, :show]
  before_action :find_education, only:[:show, :update, :destroy]

  def index
    @educations = Education.all
    # byebug
    render json: @educations
  end

  def show
      render json: @education
  end

  def create
    @education = Education.create(education_params)

    if @education.valid?
      render json: { skill: EducationSerializer.new(@education) }, status: :created
    else
      # render json: { error: 'failed to create user' }, status: :not_acceptable
      render json: { error: @education.errors.full_messages }, status: :not_acceptable
    end
  end

  def update
    # byebug
    if @education.update(education_params)
      render json: @education
    else
      render json:{errors: @education.errors.full_messages}
    end
  end

  private

  def education_params
    params.require(:education).permit( :id, :school, :degree, :graduated, :description, :user_id)
  end

  def find_education
    @education = Education.find_by_id(params[:id])
  end
end
