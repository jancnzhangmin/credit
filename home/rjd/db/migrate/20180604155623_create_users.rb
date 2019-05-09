class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :login
      t.string :password_digest
      t.integer :status
      t.string :tranaccount
      t.string :tranpassword
      t.string :admin
      t.string :vcode
      t.datetime :vcodetime

      t.timestamps
    end
  end
end
