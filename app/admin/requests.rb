ActiveAdmin.register Request do
  permit_params :begin_time, :end_time, :requestor_id, :speed_range_lower_limt, :speed_range_upper_limit, :sensor_id, :bounding_box_latitude_1, :bounding_box_latitude_2, :bounding_box_longitude_1, :bounding_box_longitude_2


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
