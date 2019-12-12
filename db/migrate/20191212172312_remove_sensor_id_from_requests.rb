class RemoveSensorIdFromRequests < ActiveRecord::Migration[6.0]
  def change
    remove_column :requests, :sensor_id
  end
end
