class AddStatusToFlowdef < ActiveRecord::Migration[5.2]
  def change
    add_column :flowdefs, :status, :integer
  end
end
