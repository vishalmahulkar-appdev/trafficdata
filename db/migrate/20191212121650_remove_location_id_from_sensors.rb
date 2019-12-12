class RemoveLocationIdFromSensors < ActiveRecord::Migration[6.0]
  def change
    remove_column :sensors, :location_id
  end
end
