class CreateFlowdefs < ActiveRecord::Migration[5.2]
  def change
    create_table :flowdefs do |t|
      t.bigint :cla_id
      t.string :name
      t.string :summary

      t.timestamps
    end
  end
end
