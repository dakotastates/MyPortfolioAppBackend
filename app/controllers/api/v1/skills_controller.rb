class Api::V1::SkillsController < ApplicationController
  skip_before_action :authorized, only: [:index, :create, :show, :update]
  before_action :find_skill, only:[:show, :update, :destroy]

  def index
    @skills = Skill.all
    render json: @skills
  end

  private

  def skill_params
    # params { user: {username: 'Chandler Bing', password: 'hi' } }
    params.require(:project).permit(:name)
  end

  def find_skill
    @skill = Skill.find_by_id(params[:id])
  end
end
