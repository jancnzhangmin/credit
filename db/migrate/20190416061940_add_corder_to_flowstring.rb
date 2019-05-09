class AddCorderToFlowstring < ActiveRecord::Migration[5.2]
  def change
    add_column :flowstrings, :corder, :integer
  end
end
