class CreateBankcards < ActiveRecord::Migration[5.2]
  def change
    create_table :bankcards do |t|
      t.references :user, foreign_key: true
      t.string :bank
      t.string :bankaccount
      t.string :bankaddress
      t.integer :isdefault
      t.string :bankname

      t.timestamps
    end
  end
end
