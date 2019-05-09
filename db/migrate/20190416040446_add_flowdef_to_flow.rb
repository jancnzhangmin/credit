class AddFlowdefToFlow < ActiveRecord::Migration[5.2]
  def change
    add_column :flows, :flowdef_id, :bigint
  end
end
