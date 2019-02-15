class CreateUsergroups < ActiveRecord::Migration[5.2]
  def change
    create_table :usergroups do |t|
      t.bigint :user_id
      t.bigint :auth_id
      t.string :name

      t.timestamps
    end
  end
end
