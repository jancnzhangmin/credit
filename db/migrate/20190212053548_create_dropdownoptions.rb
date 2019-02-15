class CreateDropdownoptions < ActiveRecord::Migration[5.2]
  def change
    create_table :dropdownoptions do |t|
      t.bigint :dropdown_id
      t.string :wordval

      t.timestamps
    end
  end
end
