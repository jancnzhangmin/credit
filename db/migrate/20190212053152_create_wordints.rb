class CreateWordints < ActiveRecord::Migration[5.2]
  def change
    create_table :wordints do |t|
      t.bigint :flowtemplate_id
      t.bigint :wordval
      t.integer :isnull
      t.string :isnullsummary
      t.string :name
      t.bigint :rank
      t.integer :showlable

      t.timestamps
    end
  end
end
