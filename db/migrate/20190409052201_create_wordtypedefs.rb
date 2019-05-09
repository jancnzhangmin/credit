class CreateWordtypedefs < ActiveRecord::Migration[5.2]
  def change
    create_table :wordtypedefs do |t|
      t.string :wordtype
      t.string :wordkey

      t.timestamps
    end
  end
end
