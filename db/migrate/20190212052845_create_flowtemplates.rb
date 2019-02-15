class CreateFlowtemplates < ActiveRecord::Migration[5.2]
  def change
    create_table :flowtemplates do |t|
      t.bigint :cla_id
      t.string :name
      t.string :subtitle
      t.string :nextlink
      t.integer :appointunion

      t.timestamps
    end
  end
end
