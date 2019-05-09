class AddBankdefidToBankcard < ActiveRecord::Migration[5.2]
  def change
    add_reference :bankcards, :bankdef, foreign_key: true
  end
end
