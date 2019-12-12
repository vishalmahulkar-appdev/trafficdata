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
#  location_id        :integer
#  type_id            :integer
#

class Sensor < ApplicationRecord
end
