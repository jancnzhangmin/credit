class AddFlowidToFlowstring < ActiveRecord::Migration[5.2]
  def change
    add_column :flowstrings, :flow_id, :bigint
  end
end
