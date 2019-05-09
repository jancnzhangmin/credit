class CreateFlowtexts < ActiveRecord::Migration[5.2]
  def change
    create_table :flowtexts do |t|
      t.bigint :flowdetail_id
      t.text :val
      t.integer :isnull
      t.string :isnullsummary

      t.timestamps
    end
  end
end
