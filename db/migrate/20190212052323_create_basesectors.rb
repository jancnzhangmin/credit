class CreateBasesectors < ActiveRecord::Migration[5.2]
  def change
    create_table :basesectors do |t|
      t.string :name
      t.string :summary
      t.string :tel

      t.timestamps
    end
  end
end
