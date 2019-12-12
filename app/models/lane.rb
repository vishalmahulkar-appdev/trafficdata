# == Schema Information
#
# Table name: lanes
#
#  id          :integer          not null, primary key
#  lane_name   :string
#  lane_number :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Lane < ApplicationRecord
end
