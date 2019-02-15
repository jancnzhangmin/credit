class CreateGrants < ActiveRecord::Migration[5.2]
  def change
    create_table :grants do |t|
      t.bigint :user_id
      t.bigint :flowtemplate_id
      t.string :summary
      t.integer :status
      t.integer :pendstatus

      t.timestamps
    end
  end
end
