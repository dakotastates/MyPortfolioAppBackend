class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create, :show, :update, :profile]
  before_action :find_user, only:[:show, :update, :destroy]
  before_action :find_social, only:[:update, :destroy]


  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def index
    @users = User.all
    # byebug
    render json: @users
  end

  def show
      render json: @user.as_json(include: {resume: {
              include: {
                educations: {
                  only: [:id, :school, :degree, :graduated, :description]
                },
                works: {
                    only: [:id, :company, :title, :years, :description]
                  },
                skills: {
                    only: [:id, :name, :level]
                  },
              },
                only: :skillmessage
        },
        portfolio: {
                include: {
                  projects: {
                    only: [:id, :title, :category, :image, :url]
                  }
                }
          },
          testimonials: {
              only: [:id, :text, :name]
            },

          address: {
                only: [:id, :street, :city, :state, :zip]
            },

          socials: {
                only: [:id, :name, :url, :className]
            },


        },
      except: [:username, :password_digest])

  end

  # def new
  #   @user = User.new
  #   @user.address.build()
  #
  # end

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
      @social = @user.socials.build(user_params)
      if @social.valid?
        render json: @social
      else
        render json:{errors: @social.errors.full_messages}
      end
      render json: @user
    else
      render json:{errors: @user.errors.full_messages}
    end
  end

  private

  def user_params
    params.require(:user).permit( :id, :username, :password, :name, :occupation, :description, :image, :bio, :contactmessage, :email, :phone, :website, :resumedownload, address_attributes: [:street, :city, :state, :zip], socials_attributes: [:name, :url, :className])
  end

  def find_user
    @user = User.find_by_id(params[:id])
  end

  def find_social
    @social = Social.find_by_id(params[:id])
  end
end
