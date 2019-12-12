class LaneCountsController < ApplicationController
  def index
    @lane_counts = LaneCount.all.order({ :created_at => :desc })

    render({ :template => "lane_counts/index.html.erb" })
  end

  def show
    the_id = params.fetch("id_from_path")
    @lane_count = LaneCount.where({:id => the_id }).at(0)

    render({ :template => "lane_counts/show.html.erb" })
  end

  def create
    @lane_count = LaneCount.new
    @lane_count.sensor_id = params.fetch("sensor_id_from_query")
    @lane_count.lane_id = params.fetch("lane_id_from_query")
    @lane_count.counts = params.fetch("counts_from_query")
    @lane_count.lane_number = params.fetch("lane_number_from_query")
    @lane_count.time = params.fetch("time_from_query")

    if @lane_count.valid?
      @lane_count.save
      redirect_to("/lane_counts", { :notice => "Lane count created successfully." })
    else
      redirect_to("/lane_counts", { :notice => "Lane count failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("id_from_path")
    @lane_count = LaneCount.where({ :id => the_id }).at(0)

    @lane_count.sensor_id = params.fetch("sensor_id_from_query")
    @lane_count.lane_id = params.fetch("lane_id_from_query")
    @lane_count.counts = params.fetch("counts_from_query")
    @lane_count.lane_number = params.fetch("lane_number_from_query")
    @lane_count.time = params.fetch("time_from_query")

    if @lane_count.valid?
      @lane_count.save
      redirect_to("/lane_counts/#{@lane_count.id}", { :notice => "Lane count updated successfully."} )
    else
      redirect_to("/lane_counts/#{@lane_count.id}", { :alert => "Lane count failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("id_from_path")
    @lane_count = LaneCount.where({ :id => the_id }).at(0)

    @lane_count.destroy

    redirect_to("/lane_counts", { :notice => "Lane count deleted successfully."} )
  end
end
