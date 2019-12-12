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
end
