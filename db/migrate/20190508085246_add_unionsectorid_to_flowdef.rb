class AddUnionsectoridToFlowdef < ActiveRecord::Migration[5.2]
  def change
    add_column :flowdefs, :unionsector_id, :bigint
  end
end
