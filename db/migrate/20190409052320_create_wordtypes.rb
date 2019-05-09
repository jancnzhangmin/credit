class CreateWordtypes < ActiveRecord::Migration[5.2]
  def change
    create_table :wordtypes do |t|
      t.bigint :flowdef_id
      t.bigint :wordtypedef_id
      t.string :name
      t.integer :isnull
      t.string :nullsummary

      t.timestamps
    end
  end
end
