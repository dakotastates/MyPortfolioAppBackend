class Api::V1::SocialsController < ApplicationController
  skip_before_action :authorized, only: [:index, :create, :update, :show]
  before_action :find_social, only:[:show, :update, :destroy]

  def index
    @socials = Social.all
    # byebug
    render json: @socials
  end

  def show
      render json: @social
  end

  def create
    @social = Social.create(social_params)

    if @social.valid?
      render json: { social: SocialSerializer.new(@social) }, status: :created
    else
      # render json: { error: 'failed to create user' }, status: :not_acceptable
      render json: { error: @social.errors.full_messages }, status: :not_acceptable
    end
  end

  def update
    # byebug
    if @social.update(social_params)
      render json: @social
    else
      render json:{errors: @social.errors.full_messages}
    end
  end

  private

  def social_params
    params.require(:social).permit( :id, :name, :url, :className, :user_id)
  end

  def find_social
    @social = Social.find_by_id(params[:id])
  end
end
