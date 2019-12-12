class LanesController < ApplicationController
  def index
    @lanes = Lane.all.order({ :created_at => :desc })

    render({ :template => "lanes/index.html.erb" })
  end

  def show
    the_id = params.fetch("id_from_path")
    @lane = Lane.where({:id => the_id }).at(0)

    render({ :template => "lanes/show.html.erb" })
  end

  def create
    @lane = Lane.new
    @lane.lane_name = params.fetch("lane_name_from_query")
    @lane.lane_number = params.fetch("lane_number_from_query")

    if @lane.valid?
      @lane.save
      redirect_to("/lanes", { :notice => "Lane created successfully." })
    else
      redirect_to("/lanes", { :notice => "Lane failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("id_from_path")
    @lane = Lane.where({ :id => the_id }).at(0)

    @lane.lane_name = params.fetch("lane_name_from_query")
    @lane.lane_number = params.fetch("lane_number_from_query")

    if @lane.valid?
      @lane.save
      redirect_to("/lanes/#{@lane.id}", { :notice => "Lane updated successfully."} )
    else
      redirect_to("/lanes/#{@lane.id}", { :alert => "Lane failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("id_from_path")
    @lane = Lane.where({ :id => the_id }).at(0)

    @lane.destroy

    redirect_to("/lanes", { :notice => "Lane deleted successfully."} )
  end
end
