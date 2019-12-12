class LaneSpeedsController < ApplicationController
  def index
    @lane_speeds = LaneSpeed.all.order({ :created_at => :desc })

    render({ :template => "lane_speeds/index.html.erb" })
  end

  def show
    the_id = params.fetch("id_from_path")
    @lane_speed = LaneSpeed.where({:id => the_id }).at(0)

    render({ :template => "lane_speeds/show.html.erb" })
  end

  def create
    @lane_speed = LaneSpeed.new
    @lane_speed.sensor_id = params.fetch("sensor_id_from_query")
    @lane_speed.lane_id = params.fetch("lane_id_from_query")
    @lane_speed.speed = params.fetch("speed_from_query")
    @lane_speed.lane_number = params.fetch("lane_number_from_query")
    @lane_speed.time = params.fetch("time_from_query")

    if @lane_speed.valid?
      @lane_speed.save
      redirect_to("/lane_speeds", { :notice => "Lane speed created successfully." })
    else
      redirect_to("/lane_speeds", { :notice => "Lane speed failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("id_from_path")
    @lane_speed = LaneSpeed.where({ :id => the_id }).at(0)

    @lane_speed.sensor_id = params.fetch("sensor_id_from_query")
    @lane_speed.lane_id = params.fetch("lane_id_from_query")
    @lane_speed.speed = params.fetch("speed_from_query")
    @lane_speed.lane_number = params.fetch("lane_number_from_query")
    @lane_speed.time = params.fetch("time_from_query")

    if @lane_speed.valid?
      @lane_speed.save
      redirect_to("/lane_speeds/#{@lane_speed.id}", { :notice => "Lane speed updated successfully."} )
    else
      redirect_to("/lane_speeds/#{@lane_speed.id}", { :alert => "Lane speed failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("id_from_path")
    @lane_speed = LaneSpeed.where({ :id => the_id }).at(0)

    @lane_speed.destroy

    redirect_to("/lane_speeds", { :notice => "Lane speed deleted successfully."} )
  end
end
