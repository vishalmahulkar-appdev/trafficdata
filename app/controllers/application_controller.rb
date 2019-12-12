class ApplicationController < ActionController::Base
  before_action(:load_current_traffic_manager)
  before_action(:force_traffic_manager_sign_in)
  
  def load_current_traffic_manager
    the_id = session.fetch(:traffic_manager_id)
    @current_traffic_manager = TrafficManager.where({ :id => the_id }).at(0)
  end
  
  def force_traffic_manager_sign_in
    if @current_traffic_manager == nil
      redirect_to("/traffic_manager_sign_in", { :notice => "You have to sign in first." })
    end
  end

end
