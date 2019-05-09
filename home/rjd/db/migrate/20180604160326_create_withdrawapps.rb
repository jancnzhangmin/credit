class CreateWithdrawapps < ActiveRecord::Migration[5.2]
  def change
    create_table :withdrawapps do |t|
      t.references :user, foreign_key: true
      t.float :amount
      t.integer :status
      t.string :message
      t.integer :tobank
      t.datetime :starttime
      t.datetime :endtime

      t.timestamps
    end
  end
end
