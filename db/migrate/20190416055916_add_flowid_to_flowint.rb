class AddFlowidToFlowint < ActiveRecord::Migration[5.2]
  def change
    add_column :flowints, :flow_id, :bigint
  end
end
