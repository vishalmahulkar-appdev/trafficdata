class CreateLaneCounts < ActiveRecord::Migration[6.0]
  def change
    create_table :lane_counts do |t|
      t.integer :sensor_id
      t.integer :lane_id
      t.integer :counts
      t.integer :lane_number
      t.datetime :time

      t.timestamps
    end
  end
end
