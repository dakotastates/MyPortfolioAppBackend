class Api::V1::WorksController < ApplicationController
  skip_before_action :authorized, only: [:create, :update, :show]
  before_action :find_work, only:[:show, :update, :destroy]

  def index
    @works = Work.all
    # byebug
    render json: @works
  end

  def show
      render json: @work
  end

  def create
    @work = Work.create(work_params)

    if @work.valid?
      render json: { skill: WorkSerializer.new(@work) }, status: :created
    else
      # render json: { error: 'failed to create user' }, status: :not_acceptable
      render json: { error: @work.errors.full_messages }, status: :not_acceptable
    end
  end

  def update
    # byebug
    if @work.update(work_params)
      render json: @work
    else
      render json:{errors: @work.errors.full_messages}
    end
  end

  private

  def work_params
    params.require(:work).permit( :id, :company, :title, :years, :description, :user_id)
  end

  def find_work
    @work = Work.find_by_id(params[:id])
  end
end
