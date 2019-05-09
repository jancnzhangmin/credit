class AddWordtypeToFlowattachment < ActiveRecord::Migration[5.2]
  def change
    add_column :flowattachments, :wordtype, :string
  end
end
