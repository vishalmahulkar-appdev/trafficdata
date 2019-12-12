class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.time :begin_time
      t.time :end_time
      t.integer :requestor_id
      t.integer :speed_range_lower_limt
      t.integer :speed_range_upper_limit
      t.integer :sensor_id
      t.float :bounding_box_latitude_1
      t.float :bounding_box_latitude_2
      t.float :bounding_box_longitude_1
      t.float :bounding_box_longitude_2

      t.timestamps
    end
  end
end
