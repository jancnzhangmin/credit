class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.bigint :basesector_id
      t.bigint :unionsector_id
      t.string :name
      t.integer :sex
      t.string :password_digest
      t.string :login
      t.integer :status
      t.string :phone
      t.string :offer

      t.timestamps
    end
  end
end
