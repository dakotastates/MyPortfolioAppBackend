class Api::V1::SocialsController < ApplicationController
  skip_before_action :authorized, only: [:index, :create, :show, :update]
  before_action :find_social, only:[:show, :update, :destroy]

  def index
    @socials = Social.all
    render json: @socials
  end

  private

  def social_params
    # params { user: {username: 'Chandler Bing', password: 'hi' } }
    params.require(:social).permit(:name)
  end

  def find_social
    @social = Social.find_by_id(params[:id])
  end
end
