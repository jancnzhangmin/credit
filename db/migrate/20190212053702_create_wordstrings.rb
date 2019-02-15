class CreateWordstrings < ActiveRecord::Migration[5.2]
  def change
    create_table :wordstrings do |t|
      t.bigint :flowtemplate_id
      t.string :wordval
      t.integer :isnull
      t.string :isnullsummary
      t.string :name
      t.bigint :rank
      t.integer :showlable

      t.timestamps
    end
  end
end
