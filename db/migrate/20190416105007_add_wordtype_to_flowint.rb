class AddWordtypeToFlowint < ActiveRecord::Migration[5.2]
  def change
    add_column :flowints, :wordtype, :string
  end
end
