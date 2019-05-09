class AddNameToFlowtext < ActiveRecord::Migration[5.2]
  def change
    add_column :flowtexts, :name, :string
  end
end
