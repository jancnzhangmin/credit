class AddStatusToBankcard < ActiveRecord::Migration[5.2]
  def change
    add_column :bankcards, :status, :integer
  end
end
