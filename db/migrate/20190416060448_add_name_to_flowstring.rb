class AddNameToFlowstring < ActiveRecord::Migration[5.2]
  def change
    add_column :flowstrings, :name, :string
  end
end
