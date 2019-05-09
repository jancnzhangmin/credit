class AddWordtypeToFlowfloat < ActiveRecord::Migration[5.2]
  def change
    add_column :flowfloats, :wordtype, :string
  end
end
