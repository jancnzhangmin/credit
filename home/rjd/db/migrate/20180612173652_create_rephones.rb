class CreateRephones < ActiveRecord::Migration[5.2]
  def change
    create_table :rephones do |t|
      t.string :phone

      t.timestamps
    end
  end
end
