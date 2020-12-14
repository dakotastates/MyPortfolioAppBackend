class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create, :show, :update, :profile]
  before_action :find_user, only:[:show, :update, :destroy]
  # include Rails.application.routes.url_helpers

  # def profile
  #   render json: { user: UserSerializer.new(current_user) }, status: :accepted
  # end

  # def index
  #   @users = User.all
  #   render json: @users
  # end

  def show
      render json: user_json(@user)

  end


  # def create
  #   @user = User.create(user_params)
  #
  #   if @user.valid?
  #     @token = encode_token({ user_id: @user.id })
  #     render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
  #   else
  #     # render json: { error: 'failed to create user' }, status: :not_acceptable
  #     render json: { error: @user.errors.full_messages }, status: :not_acceptable
  #   end
  # end

  def update
    # byebug

    @user.attributes = user_params
    # byebug
    result = @user.save
    render json: user_json(@user), status: result ? 200 : 422

  end

  def destroy
    @user.destroy
    render json: { result: :ok }
  end

  private

  def user_json(user)
    {
      id: user.id,
      name: user.name,
      occupation: user.occupation,
      description: user.description,
      image: user.image,
      # featured_image()
      # image: image(user),
      # featured_image: featured_image,
      # featured_image: rails_blob_url(user.featured_image),
      bio: user.bio,
      contactmessage: user.contactmessage,
      email: user.email,
      phone: user.phone,
      website: user.website,
      resumedownload: user.resumedownload,
      # errors: user.errors,
      address_attributes: {
        id: user.address.id,
        street: user.address.street,
        city: user.address.street,
        state: user.address.state,
        zip: user.address.zip
      },
      projects_attributes: user.projects.map do |project|
        {
          id: project.id,
          title: project.title,
          category: project.category,
          image: project.image,
          url: project.url,
          errors: project.errors,
          _destroy: project._destroy
        }
      end,
      socials_attributes: user.socials.map do |social|
        {
          id: social.id,
          name: social.name,
          url: social.url,
          className: social.className,
          # errors: social.errors,
          _destroy: social._destroy
        }
      end,
      educations_attributes: user.educations.map  do |education|
        {
          id: education.id,
          school: education.school,
          degree: education.degree,
          graduated: education.graduated,
          description: education.description,
          # errors: education.errors,
          _destroy: education._destroy
        }
      end,
      works_attributes: user.works.map do |work|
        {
          id: work.id,
          company: work.company,
          title: work.title,
          years: work.years,
          description: work.description,
          # errors: work.errors,
          _destroy: work._destroy
        }
      end,
      skills_attributes: user.skills.map do |skill|
        {
          id: skill.id,
          name: skill.name,
          level: skill.level,
          # errors: skill.errors,
          _destroy: skill._destroy
        }
      end,
      testimonials_attributes: user.testimonials.map do |testimonial|
        {
          id: testimonial.id,
          text: testimonial.text,
          name: testimonial.name,
          # errors: testimonial.errors,
          _destroy: testimonial._destroy
        }
      end
    }

  end


  def user_params
    params.require(:user).permit( :id, :username, :password, :name, :occupation, :description, :image, :featured_image, :bio, :contactmessage, :email, :phone, :website, :resumedownload,
      address_attributes: [:id, :street, :city, :state, :zip],
      socials_attributes: [:id, :name, :url, :className, :user_id, :_destroy],
      projects_attributes: [:id, :title, :category, :image, :url, :user_id, :_destroy],
      educations_attributes: [:id, :school, :degree, :graduated, :description, :user_id, :_destroy],
      works_attributes: [:id, :company, :title, :years, :description, :user_id, :_destroy],
      skills_attributes: [:id, :name, :level, :user_id, :_destroy],
      testimonials_attributes: [:id, :text, :name, :user_id, :_destroy])
  end

  def find_user
    @user = User.find_by_id(params[:id])
  end

end
