class AddCorderToFlowint < ActiveRecord::Migration[5.2]
  def change
    add_column :flowints, :corder, :integer
  end
end
