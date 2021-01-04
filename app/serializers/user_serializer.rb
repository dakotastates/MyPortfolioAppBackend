class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :name, :occupation, :description, :bio, :contactmessage, :email, :phone, :website, :resumedownload, :featured_image, :works_attributes, :educations_attributes, :skills_attributes, :projects_attributes, :socials_attributes, :testimonials_attributes, :address_attributes

  # def user_json(user)
  #   {
  #     id: user.id,
  #     name: user.name,
  #     occupation: user.occupation,
  #     description: user.description,
  #     image: user.image,
  #     # featured_image()
  #     # image: image(user),
  #     featured_image: featured_image(user),
  #     # featured_image: rails_blob_url(user.featured_image),
  #     bio: user.bio,
  #     contactmessage: user.contactmessage,
  #     email: user.email,
  #     phone: user.phone,
  #     website: user.website,
  #     resumedownload: user.resumedownload,
  #     # errors: user.errors,
  #     address_attributes: {
  #       id: user.address.id,
  #       street: user.address.street,
  #       city: user.address.street,
  #       state: user.address.state,
  #       zip: user.address.zip
  #     },
  #     projects_attributes: user.projects.map do |project|
  #       {
  #         id: project.id,
  #         title: project.title,
  #         category: project.category,
  #         image: project.image,
  #         url: project.url,
  #         # errors: project.errors,
  #         _destroy: project._destroy
  #       }
  #     end,
  #     socials_attributes: user.socials.map do |social|
  #       {
  #         id: social.id,
  #         name: social.name,
  #         url: social.url,
  #         className: social.className,
  #         # errors: social.errors,
  #         _destroy: social._destroy
  #       }
  #     end,
  #     educations_attributes: user.educations.map  do |education|
  #       {
  #         id: education.id,
  #         school: education.school,
  #         degree: education.degree,
  #         graduated: education.graduated,
  #         description: education.description,
  #         # errors: education.errors,
  #         _destroy: education._destroy
  #       }
  #     end,
  #     works_attributes: user.works.map do |work|
  #       {
  #         id: work.id,
  #         company: work.company,
  #         title: work.title,
  #         years: work.years,
  #         description: work.description,
  #         # errors: work.errors,
  #         _destroy: work._destroy
  #       }
  #     end,
  #     skills_attributes: user.skills.map do |skill|
  #       {
  #         id: skill.id,
  #         name: skill.name,
  #         level: skill.level,
  #         # errors: skill.errors,
  #         _destroy: skill._destroy
  #       }
  #     end,
  #     testimonials_attributes: user.testimonials.map do |testimonial|
  #       {
  #         id: testimonial.id,
  #         text: testimonial.text,
  #         name: testimonial.name,
  #         # errors: testimonial.errors,
  #         _destroy: testimonial._destroy
  #       }
  #     end
  #   }
  #
  # end

  def educations_attributes
     object.educations.map  do |education|
       {
         id: education.id,
         school: education.school,
         degree: education.degree,
         graduated: education.graduated,
         description: education.description,
         # errors: education.errors,
         _destroy: education._destroy
       }
     end
  end

  def testimonials_attributes
     object.testimonials.map do |testimonial|
        {
          id: testimonial.id,
          text: testimonial.text,
          name: testimonial.name,
          # errors: testimonial.errors,
          _destroy: testimonial._destroy
        }
     end
  end

  def projects_attributes
    object.projects.map do |project|
          {
            id: project.id,
            title: project.title,
            category: project.category,
            image: project.image,
            url: project.url,
            # errors: project.errors,
            _destroy: project._destroy
          }
     end
  end

  def address_attributes

    {
          id: object.address.id,
          street: object.address.street,
          city: object.address.street,
          state: object.address.state,
          zip: object.address.zip
        }
     
  end

  def skills_attributes
    object.skills.map do |skill|
      {
        id: skill.id,
        name: skill.name,
        level: skill.level,
        # errors: skill.errors,
        _destroy: skill._destroy
      }
     end
  end

  def works_attributes
    object.works.map do |work|
         {
           id: work.id,
           company: work.company,
           title: work.title,
           years: work.years,
           description: work.description,
           # errors: work.errors,
           _destroy: work._destroy
         }
     end
  end

  def socials_attributes
     object.socials.map do |social|
         {
           id: social.id,
           name: social.name,
           url: social.url,
           className: social.className,
           # errors: social.errors,
           _destroy: social._destroy
         }
     end
  end

  def featured_image
    # user.featured_image.attach(params[:featured_image])
    # user.featured_image.attach(params[:file])
    # byebug
    if object.featured_image.attached?
      {
        url: rails_blob_url(object.featured_image)
      }
    end
  end
end
