class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create, :show]
  before_action :find_user, only:[:show, :update, :destroy]

  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def index
    @users = User.all
    # byebug
    render json: @users
  end

  def show
      render json: @user
  end

  def create
    @user = User.create(user_params)

    if @user.valid?
      @token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
    else
      # render json: { error: 'failed to create user' }, status: :not_acceptable
      render json: { error: @user.errors.full_messages }, status: :not_acceptable
    end
  end

  def update
    # byebug
    if @user.update(user_params)
      render json: @user
    else
      render json:{errors: @user.errors.full_messages}
    end
  end

  private

  def user_params
    params.require(:user).permit( :id, :username, :password, :name, :occupation, :description, :image, :bio, :contactmessage, :email, :phone, :website, :resumedownload, addresses_attributes: [:street, :city, :state, :zip], socials_attributes: [:name, :url, :className])
  end

  def find_user
    @user = User.find_by_id(params[:id])
  end
end
