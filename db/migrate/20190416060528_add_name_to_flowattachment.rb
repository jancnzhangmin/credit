class AddNameToFlowattachment < ActiveRecord::Migration[5.2]
  def change
    add_column :flowattachments, :name, :string
  end
end
