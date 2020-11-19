class Api::V1::ResumesController < ApplicationController
  skip_before_action :authorized, only: [:create, :show]
  before_action :find_resume, only:[:show, :update, :destroy]

  def index
    @resumes = Resume.all
    # byebug
    render json: @resumes
  end

  def show
      render json: @resume
  end

  def create
    @resume = Resume.create(resume_params)

    if @resume.valid?
      render json: { resume: ResumeSerializer.new(@resume) }, status: :created
    else
      # render json: { error: 'failed to create user' }, status: :not_acceptable
      render json: { error: @resume.errors.full_messages }, status: :not_acceptable
    end
  end

  def update
    # byebug
    if @resume.update(user_params)
      render json: @resume
    else
      render json:{errors: @resume.errors.full_messages}
    end
  end

  private

  def user_params
    params.require(:resume).permit( :id, :skillmessage)
  end

  def find_resume
    @resume = Resume.find_by_id(params[:id])
  end
end
