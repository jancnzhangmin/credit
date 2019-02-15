class CreateAuths < ActiveRecord::Migration[5.2]
  def change
    create_table :auths do |t|
      t.string :keyword
      t.string :name

      t.timestamps
    end
  end
end
