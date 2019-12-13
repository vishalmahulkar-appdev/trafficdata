class RemoveTimeFromLaneCounts < ActiveRecord::Migration[6.0]
  def change
    remove_column :lane_counts, :time
  end
end
