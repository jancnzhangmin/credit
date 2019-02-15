class CreateUnionsectors < ActiveRecord::Migration[5.2]
  def change
    create_table :unionsectors do |t|
      t.bigint :cla_id
      t.string :name
      t.string :summary
      t.string :tel

      t.timestamps
    end
  end
end
