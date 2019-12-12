class RequestsController < ApplicationController
  def index
    @requests = Request.all.order({ :created_at => :desc })
    @lats = Sensor.pluck(:latitude)
    @lons = Sensor.pluck(:longitude)
    @sensors = Sensor.all
    render({ :template => "requests/index.html.erb" })
  end

  def show
    the_id = params.fetch("id_from_path")
    @request = Request.where({:id => the_id }).at(0)

    render({ :template => "requests/show.html.erb" })
  end

  def create
    @request = Request.new
    @request.begin_time = params.fetch("begin_time_from_query")
    @request.end_time = params.fetch("end_time_from_query")
    @request.requestor_id = params.fetch("requestor_id_from_query")
    @request.speed_range_lower_limt = params.fetch("speed_range_lower_limt_from_query")
    @request.speed_range_upper_limit = params.fetch("speed_range_upper_limit_from_query")
    @request.sensor_id = params.fetch("sensor_id_from_query")
    @request.bounding_box_latitude_1 = params.fetch("bounding_box_latitude_1_from_query")
    @request.bounding_box_latitude_2 = params.fetch("bounding_box_latitude_2_from_query")
    @request.bounding_box_longitude_1 = params.fetch("bounding_box_longitude_1_from_query")
    @request.bounding_box_longitude_2 = params.fetch("bounding_box_longitude_2_from_query")

    if @request.valid?
      @request.save
      redirect_to("/requests", { :notice => "Request created successfully." })
    else
      redirect_to("/requests", { :notice => "Request failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("id_from_path")
    @request = Request.where({ :id => the_id }).at(0)

    @request.begin_time = params.fetch("begin_time_from_query")
    @request.end_time = params.fetch("end_time_from_query")
    @request.requestor_id = params.fetch("requestor_id_from_query")
    @request.speed_range_lower_limt = params.fetch("speed_range_lower_limt_from_query")
    @request.speed_range_upper_limit = params.fetch("speed_range_upper_limit_from_query")
    @request.sensor_id = params.fetch("sensor_id_from_query")
    @request.bounding_box_latitude_1 = params.fetch("bounding_box_latitude_1_from_query")
    @request.bounding_box_latitude_2 = params.fetch("bounding_box_latitude_2_from_query")
    @request.bounding_box_longitude_1 = params.fetch("bounding_box_longitude_1_from_query")
    @request.bounding_box_longitude_2 = params.fetch("bounding_box_longitude_2_from_query")

    if @request.valid?
      @request.save
      redirect_to("/requests/#{@request.id}", { :notice => "Request updated successfully."} )
    else
      redirect_to("/requests/#{@request.id}", { :alert => "Request failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("id_from_path")
    @request = Request.where({ :id => the_id }).at(0)

    @request.destroy

    redirect_to("/requests", { :notice => "Request deleted successfully."} )
  end
end
