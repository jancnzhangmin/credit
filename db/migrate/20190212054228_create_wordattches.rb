class CreateWordattches < ActiveRecord::Migration[5.2]
  def change
    create_table :wordattches do |t|
      t.bigint :flowtemplate_id
      t.string :name
      t.bigint :rank
      t.integer :showlable

      t.timestamps
    end
  end
end
