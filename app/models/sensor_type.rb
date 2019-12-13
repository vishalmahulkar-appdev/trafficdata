# == Schema Information
#
# Table name: sensor_types
#
#  id          :integer          not null, primary key
#  sensor_type :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class SensorType < ApplicationRecord
  has_many :sensors, :foreign_key => "type_id", :dependent => :destroy
  validates :sensor_type, :presence => true
end
