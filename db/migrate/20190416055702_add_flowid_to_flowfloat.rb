class AddFlowidToFlowfloat < ActiveRecord::Migration[5.2]
  def change
    add_column :flowfloats, :flow_id, :bigint
  end
end
