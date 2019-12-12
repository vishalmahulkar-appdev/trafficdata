class TrafficManagersController < ApplicationController
  skip_before_action(:force_traffic_manager_sign_in, { :only => [:new_registration_form, :create] })
  
  def new_registration_form
    render({ :template => "traffic_manager_sessions/sign_up.html.erb" })
  end

  def create
    @traffic_manager = TrafficManager.new
    @traffic_manager.email = params.fetch("email_from_query")
    @traffic_manager.password = params.fetch("password_from_query")
    @traffic_manager.password_confirmation = params.fetch("password_confirmation_from_query")
    @traffic_manager.first_name = params.fetch("first_name_from_query")
    @traffic_manager.last_name = params.fetch("last_name_from_query")

    save_status = @traffic_manager.save

    if save_status == true
      session.store(:traffic_manager_id,  @traffic_manager.id)
   
      redirect_to("/", { :notice => "Traffic manager account created successfully."})
    else
      redirect_to("/traffic_manager_sign_up", { :alert => "Traffic manager account failed to create successfully."})
    end
  end
    
  def edit_registration_form
    render({ :template => "traffic_managers/edit_profile.html.erb" })
  end

  def update
    @traffic_manager = @current_traffic_manager
    @traffic_manager.email = params.fetch("email_from_query")
    @traffic_manager.password = params.fetch("password_from_query")
    @traffic_manager.password_confirmation = params.fetch("password_confirmation_from_query")
    @traffic_manager.first_name = params.fetch("first_name_from_query")
    @traffic_manager.last_name = params.fetch("last_name_from_query")
    
    if @traffic_manager.valid?
      @traffic_manager.save

      redirect_to("/", { :notice => "Traffic manager account updated successfully."})
    else
      render({ :template => "traffic_managers/edit_profile_with_errors.html.erb" })
    end
  end

  def destroy
    @current_traffic_manager.destroy
    reset_session
    
    redirect_to("/", { :notice => "TrafficManager account cancelled" })
  end
  
end
