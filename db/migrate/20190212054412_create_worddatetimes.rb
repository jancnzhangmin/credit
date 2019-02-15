class CreateWorddatetimes < ActiveRecord::Migration[5.2]
  def change
    create_table :worddatetimes do |t|
      t.bigint :flowtemplate_id
      t.datetime :wordval
      t.integer :isnull
      t.string :isnullsummary
      t.integer :datetype
      t.string :name
      t.bigint :rank
      t.integer :showlable

      t.timestamps
    end
  end
end
