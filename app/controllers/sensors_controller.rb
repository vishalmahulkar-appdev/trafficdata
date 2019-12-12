class SensorsController < ApplicationController
  
  def index
    @sensors = Sensor.all.order({ :created_at => :desc })
    @lats = Sensor.pluck(:latitude)
    @lons = Sensor.pluck(:longitude)

    render({ :template => "sensors/index.html.erb" })
  end

  def show_sensor_list
    @sensors = Sensor.all.order({ :created_at => :desc })
    render({ :template => "sensors/show_sensor_list.html.erb" })
  end

  def add_sensor_page
    @sensortypes = SensorType.all
    render({ :template => "sensors/add_sensor.html.erb" })
  end

  def show
    the_id = params.fetch("id_from_path")
    @sensor = Sensor.where({:id => the_id }).at(0)
    @sensortypes = SensorType.all
    render({ :template => "sensors/show.html.erb" })
  end

  def create
    @sensor = Sensor.new
    @sensor.type_id = params.fetch("type_id_from_query")
    @sensor.sensor_name = params.fetch("sensor_name_from_query")
    @sensor.operational_status = params.fetch("operational_status_from_query", false)
    @sensor.latitude = params.fetch("latitude_from_query")
    @sensor.longitude = params.fetch("longitude_from_query")   

    if @sensor.valid?
      @sensor.save
      redirect_to("/show_sensor_list", { :notice => "Sensor created successfully." })
    else
      redirect_to("/show_sensor_list", { :notice => "Sensor failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("id_from_path")
    @sensor = Sensor.where({ :id => the_id }).at(0)

    @sensor.type_id = params.fetch("type_id_from_query")
    @sensor.sensor_name = params.fetch("sensor_name_from_query")
    @sensor.operational_status = params.fetch("operational_status_from_query", false)
    @sensor.latitude = params.fetch("latitude_from_query")
    @sensor.longitude = params.fetch("longitude_from_query")

    if @sensor.valid?
      @sensor.save
      redirect_to("/sensors/#{@sensor.id}", { :notice => "Sensor updated successfully."} )
    else
      redirect_to("/sensors/#{@sensor.id}", { :alert => "Sensor failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("id_from_path")
    @sensor = Sensor.where({ :id => the_id }).at(0)

    @sensor.destroy

    redirect_to("/show_sensor_list", { :notice => "Sensor deleted successfully."} )
  end
end
