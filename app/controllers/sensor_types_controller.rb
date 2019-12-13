class SensorTypesController < ApplicationController
  def index
    @sensor_types = SensorType.all.order({ :created_at => :desc })

    render({ :template => "sensor_types/index.html.erb" })
  end

  def show
    the_id = params.fetch("id_from_path")
    @sensor_type = SensorType.where({:id => the_id }).at(0)

    render({ :template => "sensor_types/show.html.erb" })
  end

  def create
    @sensor_type = SensorType.new
    @sensor_type.sensor_type = params.fetch("sensor_type_from_query")

    if @sensor_type.valid?
      @sensor_type.save
      redirect_to("/add_new_sensor_page", { :notice => "Sensor type created successfully." })
    else
      redirect_to("/sensor_types", { :notice => "Sensor type failed to create successfully." })
    end
  end

  def create_modal
    @sensor_type = SensorType.new
    @sensor_type.sensor_type = params.fetch("sensor_type_from_query")
    sid = params.fetch("sensor_id_from_query")

    if @sensor_type.valid?
      @sensor_type.save
      if sid != nil
        redirect_to("/sensors/"+sid.to_s, { :notice => "Sensor type created successfully." })
      else
        redirect_to("/add_new_sensor_page", { :notice => "Sensor type created successfully." })
      end
    else
      redirect_to("", { :notice => "Sensor type failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("id_from_path")
    @sensor_type = SensorType.where({ :id => the_id }).at(0)

    @sensor_type.sensor_type = params.fetch("sensor_type_from_query")

    if @sensor_type.valid?
      @sensor_type.save
      redirect_to("/sensor_types/#{@sensor_type.id}", { :notice => "Sensor type updated successfully."} )
    else
      redirect_to("/sensor_types/#{@sensor_type.id}", { :alert => "Sensor type failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("id_from_path")
    @sensor_type = SensorType.where({ :id => the_id }).at(0)

    @sensor_type.destroy

    redirect_to("/sensor_types", { :notice => "Sensor type deleted successfully."} )
  end
end
