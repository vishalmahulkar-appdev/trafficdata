class RequestsController < ApplicationController

  def index
    @requests = Request.where({ :requestor_id => @current_traffic_manager.id}).order({ :created_at => :desc })
    @lats = Sensor.pluck(:latitude)
    @lons = Sensor.pluck(:longitude)
    @sensors = Sensor.all
    render({ :template => "requests/index.html.erb" })
  end

  def request_history
    traffic_manager_id = session[:traffic_manager_id]
    @requests = Request.where({ :requestor_id => traffic_manager_id}).order({ :created_at => :desc })
    @sensors = Sensor.all
    
    render({ :template => "requests/show_request_history.html.erb" })
  end

  def show
    the_id = params.fetch("id_from_path")
    @request = Request.where({:id => the_id }).at(0)
    @sensors = Sensor.all

    render({ :template => "requests/show.html.erb" })
  end

  def show_data_map
    the_id = params.fetch("id_from_path")
    @request = Request.where({:id => the_id }).at(0)
    @sensors = Sensor.all

    
    if @request.data_tag == "Speed"
      @data = Array.new
      indata = @request.get_speed_data
      idx = 0  
      indata.each do |thisdata|
        if thisdata.fetch(:speeds).count > 0
          @data.push(thisdata)
        end
      end
    end

    if @request.data_tag == "Count"
      @data = Array.new
      indata = @request.get_count_data
      idx = 0  
      indata.each do |thisdata|
        if thisdata.fetch(:counts).count > 0
          @data.push(thisdata)
        end
      end
    end

    if @request.data_tag == "SpeedCount"
      @data = @request.get_speedcount_data
    end

    render({ :template => "requests/show_data_map.html.erb" })
  end

  def show_data_json
    the_id = params.fetch("id_from_path")
    @request = Request.where({:id => the_id }).at(0)
    @sensors = Sensor.all

    if @request.data_tag == "Speed"
      @data = @request.get_speed_data
    end

    if @request.data_tag == "Count"
      @data = @request.get_count_data
    end

    if @request.data_tag == "SpeedCount"
      @data = @request.get_speedcount_data
    end

    render({ :json => @data.as_json })
  end

  def show_data_html
    the_id = params.fetch("id_from_path")
    @request = Request.where({:id => the_id }).at(0)
    @sensors = Sensor.all

    if @request.data_tag == "Speed"
      @data = @request.get_speed_data
    end

    if @request.data_tag == "Count"
      @data = @request.get_count_data
    end

    if @request.data_tag == "SpeedCount"
      @data = @request.get_speedcount_data
    end

    render({ :template => "requests/show_data_html.html.erb" })
  end

  def create
    @request = Request.new
    @request.begin_time = params.fetch("begin_time_from_query")
    @request.end_time = params.fetch("end_time_from_query")
    @request.requestor_id = session[:traffic_manager_id]
    @request.speed_range_lower_limt = params.fetch("speed_range_lower_limt_from_query")
    @request.speed_range_upper_limit = params.fetch("speed_range_upper_limit_from_query")
    @request.bounding_box_latitude_1 = params.fetch("bounding_box_latitude_1_from_query")
    @request.bounding_box_latitude_2 = params.fetch("bounding_box_latitude_2_from_query")
    @request.bounding_box_longitude_1 = params.fetch("bounding_box_longitude_1_from_query")
    @request.bounding_box_longitude_2 = params.fetch("bounding_box_longitude_2_from_query")
    @request.data_tag = params.fetch("data_tag_from_query")

    #lat_north = @request.bounding_box_latitude_1
    #lat_south = @request.bounding_box_latitude_2
    #lon_west  = @request.bounding_box_longitude_1
    #lon_east  = @request.bounding_box_longitude_2

    #@selected_sensors = Sensor.all.pluck(:id, :latitude, :longitude).select{ |(i,x,y)| x > lat_south && x < lat_north && y > lon_west && y < lon_east}
    
    #sensor_ids = @selected_sensors.map{|row| row[0]}
    @request.sensor_list = @request.get_sensor_ids

    if @request.valid?
      @request.save
      redirect_to("/request_history", { :notice => "Request created successfully." })
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

    redirect_to("/request_history", { :notice => "Request deleted successfully."} )
  end
end
