class TrafficManagerSessionsController < ApplicationController
  skip_before_action(:force_traffic_manager_sign_in, { :only => [:new_session_form, :add_cookie] })

  def new_session_form
    render({ :template => "traffic_manager_sessions/sign_in.html.erb" })
  end

  def add_cookie
    traffic_manager = TrafficManager.where({ :email => params.fetch("email_from_query") }).at(0)
    
    the_supplied_password = params.fetch("password_from_query")
    
    if traffic_manager != nil
      are_they_legit = traffic_manager.authenticate(the_supplied_password)
    
      if are_they_legit == false
        redirect_to("/traffic_manager_sign_in", { :alert => "Password incorrect." })
      else
        session.store(:traffic_manager_id, traffic_manager.id)
      
        redirect_to("/", { :notice => "Signed in successfully." })
      end
    else
      redirect_to("/traffic_manager_sign_in", { :alert => "There's no traffic_manager account with that email address." })
    end
  end

  def remove_cookies
    reset_session

    redirect_to("/", { :notice => "Signed out successfully." })
  end
 
end
