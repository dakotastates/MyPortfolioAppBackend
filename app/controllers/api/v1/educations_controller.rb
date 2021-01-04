class Api::V1::EducationsController < ApplicationController
  skip_before_action :authorized, only: [:index, :create, :show, :update]
  before_action :find_education, only:[:show, :update, :destroy]

  def index
    @educations = Education.all
    render json: @educations
  end

  private

  def education_params
    # params { user: {username: 'Chandler Bing', password: 'hi' } }
    params.require(:education).permit(:title)
  end

  def find_education
    @education = Education.find_by_id(params[:id])
  end
end
