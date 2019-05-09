class AddFlowidToFlowattachment < ActiveRecord::Migration[5.2]
  def change
    add_column :flowattachments, :flow_id, :bigint
  end
end
