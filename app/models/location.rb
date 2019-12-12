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
end
