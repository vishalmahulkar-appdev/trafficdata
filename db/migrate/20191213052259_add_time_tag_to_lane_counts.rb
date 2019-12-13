class AddTimeTagToLaneCounts < ActiveRecord::Migration[6.0]
  def change
    add_column :lane_counts, :time_tag, :integer
  end
end
