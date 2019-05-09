class AddFlowidToFlowtext < ActiveRecord::Migration[5.2]
  def change
    add_column :flowtexts, :flow_id, :bigint
  end
end
