class Api::V1::ProjectsController < ApplicationController
  skip_before_action :authorized, only: [:index, :create, :update, :show]
  before_action :find_project, only:[:show, :update, :destroy]

  def index
    @projects = Project.all
    # byebug
    render json: @projects
  end

  def show
      render json: @project
  end

  def create
    @project = Project.create(project_params)

    if @project.valid?
      render json: { project: ProjectSerializer.new(@project) }, status: :created
    else
      # render json: { error: 'failed to create user' }, status: :not_acceptable
      render json: { error: @project.errors.full_messages }, status: :not_acceptable
    end
  end

  def update
    # byebug
    if @project.update(project_params)
      render json: @project
    else
      render json:{errors: @project.errors.full_messages}
    end
  end

  private

  def project_params
    params.require(:project).permit( :id, :title, :category, :image, :url, :user_id)
  end

  def find_project
    @project = Project.find_by_id(params[:id])
  end
end
