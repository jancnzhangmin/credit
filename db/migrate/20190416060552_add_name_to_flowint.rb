class AddNameToFlowint < ActiveRecord::Migration[5.2]
  def change
    add_column :flowints, :name, :string
  end
end
