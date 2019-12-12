class CreateLanes < ActiveRecord::Migration[6.0]
  def change
    create_table :lanes do |t|
      t.string :lane_name
      t.integer :lane_number

      t.timestamps
    end
  end
end
