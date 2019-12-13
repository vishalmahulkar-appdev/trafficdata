# == Schema Information
#
# Table name: requests
#
#  id                       :integer          not null, primary key
#  begin_time               :time
#  bounding_box_latitude_1  :float
#  bounding_box_latitude_2  :float
#  bounding_box_longitude_1 :float
#  bounding_box_longitude_2 :float
#  data_tag                 :string
#  end_time                 :time
#  sensor_list              :text
#  speed_range_lower_limt   :integer
#  speed_range_upper_limit  :integer
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  requestor_id             :integer
#

class Request < ApplicationRecord
  belongs_to :requestor, :class_name => "TrafficManager"

  serialize :sensor_list

  def get_sensor_ids
    lat_north = self.bounding_box_latitude_1
    lat_south = self.bounding_box_latitude_2
    lon_west  = self.bounding_box_longitude_1
    lon_east  = self.bounding_box_longitude_2

    selected_sensors = Sensor.all.pluck(:id, :latitude, :longitude).select{ |(i,x,y)| x > lat_south && x < lat_north && y > lon_west && y < lon_east}
    
    sensor_ids = selected_sensors.map{|row| row[0]}
    return sensor_ids
  end

  def get_speed_data
    data = Array.new
    self.sensor_list.each do |sensor_id|
      data.push(
        { 
          :sensor_name => Sensor.where( { :id => sensor_id } ).at(0).sensor_name , 
          :lat => Sensor.where( { :id => sensor_id } ).at(0).latitude,
          :lon => Sensor.where( { :id => sensor_id } ).at(0).longitude, 
          :times=>LaneSpeed.where( {:sensor_id => sensor_id } ).pluck(:time_tag),
          :speeds=>LaneSpeed.where( {:sensor_id => sensor_id } ).pluck(:speed)
        }
      )
    end
    return data
  end

  def get_count_data
    data = Array.new
    self.sensor_list.each do |sensor_id|
      data.push(
        { 
          :sensor_name => Sensor.where( { :id => sensor_id } ).at(0).sensor_name , 
          :lat => Sensor.where( { :id => sensor_id } ).at(0).latitude,
          :lon => Sensor.where( { :id => sensor_id } ).at(0).longitude, 
          :times=>LaneCount.where( {:sensor_id => sensor_id } ).pluck(:time_tag),
          :counts=>LaneCount.where( {:sensor_id => sensor_id } ).pluck(:counts)
        }
      )
    end
    return data
  end

  def get_speedcount_data
    data = Array.new
    self.sensor_list.each do |sensor_id|
      data.push(
        { 
          :sensor_name => Sensor.where( { :id => sensor_id } ).at(0).sensor_name , 
          :lat => Sensor.where( { :id => sensor_id } ).at(0).latitude,
          :lon => Sensor.where( { :id => sensor_id } ).at(0).longitude, 
          :speeds_times=>LaneSpeed.where( {:sensor_id => sensor_id } ).pluck(:time_tag),
          :speeds=>LaneSpeed.where( {:sensor_id => sensor_id } ).pluck(:speed),
          :counts_times=>LaneCount.where( {:sensor_id => sensor_id } ).pluck(:time_tag),
          :counts=>LaneCount.where( {:sensor_id => sensor_id } ).pluck(:counts)
        }
      )
    end
    return data
  end
end
