class LocationsController < ApplicationController
  def index
    @locations = Location.all.order({ :created_at => :desc })

    render({ :template => "locations/index.html.erb" })
  end

  def show
    the_id = params.fetch("id_from_path")
    @location = Location.where({:id => the_id }).at(0)

    render({ :template => "locations/show.html.erb" })
  end

  def create
    @location = Location.new
    @location.latitude = params.fetch("latitude_from_query")
    @location.longitude = params.fetch("longitude_from_query")

    if @location.valid?
      @location.save
      redirect_to("/locations", { :notice => "Location created successfully." })
    else
      redirect_to("/locations", { :notice => "Location failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("id_from_path")
    @location = Location.where({ :id => the_id }).at(0)

    @location.latitude = params.fetch("latitude_from_query")
    @location.longitude = params.fetch("longitude_from_query")

    if @location.valid?
      @location.save
      redirect_to("/locations/#{@location.id}", { :notice => "Location updated successfully."} )
    else
      redirect_to("/locations/#{@location.id}", { :alert => "Location failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("id_from_path")
    @location = Location.where({ :id => the_id }).at(0)

    @location.destroy

    redirect_to("/locations", { :notice => "Location deleted successfully."} )
  end
end
