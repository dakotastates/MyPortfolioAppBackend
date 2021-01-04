class Api::V1::ProjectsController < ApplicationController
  skip_before_action :authorized, only: [:index, :create, :show, :update]
  before_action :find_project, only:[:show, :update, :destroy]

  def index
    @projects = Project.all
    render json: @projects
  end

  private

  def project_params
    # params { user: {username: 'Chandler Bing', password: 'hi' } }
    params.require(:project).permit(:title)
  end

  def find_project
    @project = Project.find_by_id(params[:id])
  end
end
