# == Schema Information
#
# Table name: lane_speeds
#
#  id          :integer          not null, primary key
#  lane_number :integer
#  speed       :integer
#  time        :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  lane_id     :integer
#  sensor_id   :integer
#

class LaneSpeed < ApplicationRecord
end
