class AddDataTagToRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :requests, :data_tag, :string
  end
end
