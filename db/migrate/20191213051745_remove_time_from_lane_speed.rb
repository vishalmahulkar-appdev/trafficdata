class RemoveTimeFromLaneSpeed < ActiveRecord::Migration[6.0]
  def change
    remove_column :lane_speeds, :time
  end
end
