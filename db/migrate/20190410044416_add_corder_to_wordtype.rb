class AddCorderToWordtype < ActiveRecord::Migration[5.2]
  def change
    add_column :wordtypes, :corder, :bigint
  end
end
