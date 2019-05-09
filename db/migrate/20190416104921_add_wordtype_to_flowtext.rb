class AddWordtypeToFlowtext < ActiveRecord::Migration[5.2]
  def change
    add_column :flowtexts, :wordtype, :string
  end
end
