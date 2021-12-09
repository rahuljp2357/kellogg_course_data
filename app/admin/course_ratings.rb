ActiveAdmin.register CourseRating do

 permit_params :user_id, :facet_1_rating, :facet_2_rating, :facet_3_rating, :facet_4_rating, :facet_5_rating, :descriptive_q1, :descriptive_q2, :descriptive_q3, :course_offering_id

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
