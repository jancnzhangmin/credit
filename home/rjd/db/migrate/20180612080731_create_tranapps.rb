class CreateTranapps < ActiveRecord::Migration[5.2]
  def change
    create_table :tranapps do |t|
      t.references :user, foreign_key: true
      t.datetime :starttime
      t.datetime :endtime
      t.integer :status
      t.text :message

      t.timestamps
    end
  end
end
