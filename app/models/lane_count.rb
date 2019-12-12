# == Schema Information
#
# Table name: lane_counts
#
#  id          :integer          not null, primary key
#  counts      :integer
#  lane_number :integer
#  time        :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  lane_id     :integer
#  sensor_id   :integer
#

class LaneCount < ApplicationRecord
  belongs_to :sensor
  belongs_to :lane
  has_one :location, :through => :sensor, :source => :location
end
