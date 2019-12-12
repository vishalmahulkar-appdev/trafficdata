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
  has_many :lane_speeds, :dependent => :destroy
  has_many :lane_counts, :dependent => :destroy
end
