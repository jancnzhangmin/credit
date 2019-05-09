class CreateOpinions < ActiveRecord::Migration[5.2]
  def change
    create_table :opinions do |t|
      t.bigint :flow_id
      t.bigint :user_id
      t.integer :status
      t.text :summary

      t.timestamps
    end
  end
end
