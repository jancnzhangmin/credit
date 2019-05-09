class CreateUserfeedadmins < ActiveRecord::Migration[5.2]
  def change
    create_table :userfeedadmins do |t|
      t.bigint :user_id
      t.bigint :cla_id

      t.timestamps
    end
  end
end
