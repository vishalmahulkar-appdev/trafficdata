class AddTimeTagToLaneSpeeds < ActiveRecord::Migration[6.0]
  def change
    add_column :lane_speeds, :time_tag, :integer
  end
end
