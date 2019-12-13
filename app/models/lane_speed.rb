# == Schema Information
#
# Table name: lane_speeds
#
#  id          :integer          not null, primary key
#  lane_number :integer
#  speed       :integer
#  time_tag    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  lane_id     :integer
#  sensor_id   :integer
#

class LaneSpeed < ApplicationRecord
  belongs_to :sensor
  belongs_to :lane
  has_one :location, :through => :sensor, :source => :location
  
end
