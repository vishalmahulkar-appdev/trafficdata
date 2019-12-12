# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  latitude   :integer
#  longitude  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Location < ApplicationRecord
  has_many :sensors, :dependent => :destroy
  has_many :speeds, :through => :sensors, :source => :speeds
  has_many :volumes, :through => :sensors, :source => :volumes  
end
