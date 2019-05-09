class AddCorderToFlowtext < ActiveRecord::Migration[5.2]
  def change
    add_column :flowtexts, :corder, :integer
  end
end
