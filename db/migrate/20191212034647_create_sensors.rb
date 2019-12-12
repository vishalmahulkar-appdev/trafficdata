class CreateSensors < ActiveRecord::Migration[6.0]
  def change
    create_table :sensors do |t|
      t.integer :type_id
      t.integer :location_id
      t.string :sensor_name
      t.boolean :operational_status
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
