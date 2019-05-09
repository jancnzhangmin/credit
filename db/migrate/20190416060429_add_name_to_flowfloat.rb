class AddNameToFlowfloat < ActiveRecord::Migration[5.2]
  def change
    add_column :flowfloats, :name, :string
  end
end
