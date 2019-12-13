# == Schema Information
#
# Table name: sensors
#
#  id                 :integer          not null, primary key
#  latitude           :float
#  longitude          :float
#  operational_status :boolean
#  sensor_name        :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  type_id            :integer
#

class Sensor < ApplicationRecord
  has_many :speeds, :class_name => "LaneSpeed", :dependent => :destroy
  has_many :volumes, :class_name => "LaneCount", :dependent => :destroy
  belongs_to :type, :class_name => "SensorType"
  validates :type_id, :presence => true
  validates :sensor_name, :latitude, :longitude, presence: true 
  validates :latitude, :longitude, numericality: true
end
