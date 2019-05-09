class CreateProcesslogs < ActiveRecord::Migration[5.2]
  def change
    create_table :processlogs do |t|
      t.text :message
      t.string :admin

      t.timestamps
    end
  end
end
