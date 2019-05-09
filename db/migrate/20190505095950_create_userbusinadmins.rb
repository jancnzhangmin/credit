class CreateUserbusinadmins < ActiveRecord::Migration[5.2]
  def change
    create_table :userbusinadmins do |t|
      t.bigint :user_id
      t.bigint :cla_id

      t.timestamps
    end
  end
end
