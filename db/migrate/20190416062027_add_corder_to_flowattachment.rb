class AddCorderToFlowattachment < ActiveRecord::Migration[5.2]
  def change
    add_column :flowattachments, :corder, :integer
  end
end
