class AddStatusToFlowtemplate < ActiveRecord::Migration[5.2]
  def change
    add_column :flowtemplates, :status, :integer
  end
end
