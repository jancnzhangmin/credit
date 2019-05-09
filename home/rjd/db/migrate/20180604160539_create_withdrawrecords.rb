class CreateWithdrawrecords < ActiveRecord::Migration[5.2]
  def change
    create_table :withdrawrecords do |t|
      t.references :user, foreign_key: true
      t.string :bank
      t.string :bankaccount
      t.string :bankaddress
      t.string :bankname
      t.float :amount
      t.string :admin

      t.timestamps
    end
  end
end
