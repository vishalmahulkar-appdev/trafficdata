class AddSensorListToRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :requests, :sensor_list, :text
  end
end
