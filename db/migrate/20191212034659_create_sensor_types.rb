class CreateSensorTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :sensor_types do |t|
      t.string :sensor_type

      t.timestamps
    end
  end
end
