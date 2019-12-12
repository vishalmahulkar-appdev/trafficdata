Rails.application.routes.draw do

  match("/", { :controller => "traffic_managers", :action => "index", :via => "get" })

    #------------------------------

  # Routes for signing up
  match("/traffic_manager_sign_up", { :controller => "traffic_managers", :action => "new_registration_form", :via => "get"})
  
  # Routes for signing in
  match("/traffic_manager_sign_in", { :controller => "traffic_manager_sessions", :action => "new_session_form", :via => "get"})
  match("/traffic_manager_verify_credentials", { :controller => "traffic_manager_sessions", :action => "add_cookie", :via => "post"})
  
  # Route for signing out
  match("/traffic_manager_sign_out", { :controller => "traffic_manager_sessions", :action => "remove_cookies", :via => "get"})
  
  # Route for creating account into database 
  match("/post_traffic_manager", { :controller => "traffic_managers", :action => "create", :via => "post" })
  
  # Route for editing account
  match("/edit_traffic_manager", { :controller => "traffic_managers", :action => "edit_registration_form", :via => "get"})
  match("/patch_traffic_manager", { :controller => "traffic_managers", :action => "update", :via => "post"})
  
  # Route for removing an account
  match("/cancel_traffic_manager_account", { :controller => "traffic_managers", :action => "destroy", :via => "get"})



  # Routes for the Lane resource:

  # CREATE
  match("/insert_lane", { :controller => "lanes", :action => "create", :via => "post"})
          
  # READ
  match("/lanes", { :controller => "lanes", :action => "index", :via => "get"})
  
  match("/lanes/:id_from_path", { :controller => "lanes", :action => "show", :via => "get"})
  
  # UPDATE
  
  match("/modify_lane/:id_from_path", { :controller => "lanes", :action => "update", :via => "post"})
  
  # DELETE
  match("/delete_lane/:id_from_path", { :controller => "lanes", :action => "destroy", :via => "get"})

  #------------------------------

  # Routes for the Lane count resource:

  # CREATE
  match("/insert_lane_count", { :controller => "lane_counts", :action => "create", :via => "post"})
          
  # READ
  match("/lane_counts", { :controller => "lane_counts", :action => "index", :via => "get"})
  
  match("/lane_counts/:id_from_path", { :controller => "lane_counts", :action => "show", :via => "get"})
  
  # UPDATE
  
  match("/modify_lane_count/:id_from_path", { :controller => "lane_counts", :action => "update", :via => "post"})
  
  # DELETE
  match("/delete_lane_count/:id_from_path", { :controller => "lane_counts", :action => "destroy", :via => "get"})

  #------------------------------

  # Routes for the Location resource:

  # CREATE
  match("/insert_location", { :controller => "locations", :action => "create", :via => "post"})
          
  # READ
  match("/locations", { :controller => "locations", :action => "index", :via => "get"})
  
  match("/locations/:id_from_path", { :controller => "locations", :action => "show", :via => "get"})
  
  # UPDATE
  
  match("/modify_location/:id_from_path", { :controller => "locations", :action => "update", :via => "post"})
  
  # DELETE
  match("/delete_location/:id_from_path", { :controller => "locations", :action => "destroy", :via => "get"})

  #------------------------------

  # Routes for the Sensor type resource:

  # CREATE
  match("/insert_sensor_type", { :controller => "sensor_types", :action => "create", :via => "post"})
          
  # READ
  match("/sensor_types", { :controller => "sensor_types", :action => "index", :via => "get"})
  
  match("/sensor_types/:id_from_path", { :controller => "sensor_types", :action => "show", :via => "get"})
  
  # UPDATE
  
  match("/modify_sensor_type/:id_from_path", { :controller => "sensor_types", :action => "update", :via => "post"})
  
  # DELETE
  match("/delete_sensor_type/:id_from_path", { :controller => "sensor_types", :action => "destroy", :via => "get"})

  #------------------------------

  # Routes for the Sensor resource:

  # CREATE
  match("/insert_sensor", { :controller => "sensors", :action => "create", :via => "post"})
          
  # READ
  match("/sensors", { :controller => "sensors", :action => "index", :via => "get"})
  match("/sensors/:id_from_path", { :controller => "sensors", :action => "show", :via => "get"})
  
  # UPDATE
  
  match("/modify_sensor/:id_from_path", { :controller => "sensors", :action => "update", :via => "post"})
  
  # DELETE
  match("/delete_sensor/:id_from_path", { :controller => "sensors", :action => "destroy", :via => "get"})

  #------------------------------

  # Routes for the Request resource:

  # CREATE
  match("/insert_request", { :controller => "requests", :action => "create", :via => "post"})
          
  # READ
  match("/requests", { :controller => "requests", :action => "index", :via => "get"})
  
  match("/requests/:id_from_path", { :controller => "requests", :action => "show", :via => "get"})
  
  # UPDATE
  
  match("/modify_request/:id_from_path", { :controller => "requests", :action => "update", :via => "post"})
  
  # DELETE
  match("/delete_request/:id_from_path", { :controller => "requests", :action => "destroy", :via => "get"})


  #------------------------------

  # Routes for the Lane speed resource:

  # CREATE
  match("/insert_lane_speed", { :controller => "lane_speeds", :action => "create", :via => "post"})
          
  # READ
  match("/lane_speeds", { :controller => "lane_speeds", :action => "index", :via => "get"})
  
  match("/lane_speeds/:id_from_path", { :controller => "lane_speeds", :action => "show", :via => "get"})
  
  # UPDATE
  
  match("/modify_lane_speed/:id_from_path", { :controller => "lane_speeds", :action => "update", :via => "post"})
  
  # DELETE
  match("/delete_lane_speed/:id_from_path", { :controller => "lane_speeds", :action => "destroy", :via => "get"})

  #------------------------------

  # ======= Add Your Routes Above These =============
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
