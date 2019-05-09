class AddCorderToFlowfloat < ActiveRecord::Migration[5.2]
  def change
    add_column :flowfloats, :corder, :integer
  end
end
