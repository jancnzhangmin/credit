class AddValToFlowattachment < ActiveRecord::Migration[5.2]
  def change
    add_column :flowattachments, :val, :string
  end
end
