class Api::V1::SkillsController < ApplicationController
  skip_before_action :authorized, only: [:create, :update, :show]
  before_action :find_skill, only:[:show, :update, :destroy]

  def index
    @skills = Skill.all
    # byebug
    render json: @skills
  end

  def show
      render json: @skill
  end

  def create
    @skill = Skill.create(skill_params)

    if @skill.valid?
      render json: { skill: SkillSerializer.new(@skill) }, status: :created
    else
      # render json: { error: 'failed to create user' }, status: :not_acceptable
      render json: { error: @skill.errors.full_messages }, status: :not_acceptable
    end
  end

  def update
    # byebug
    if @skill.update(skill_params)
      render json: @skill
    else
      render json:{errors: @social.errors.full_messages}
    end
  end

  private

  def skill_params
    params.require(:skill).permit( :id, :name, :level, :user_id)
  end

  def find_skill
    @skill = Skill.find_by_id(params[:id])
  end
end
