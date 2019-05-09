class CreateFlows < ActiveRecord::Migration[5.2]
  def change
    create_table :flows do |t|
      t.string :title
      t.string :summary
      t.string :currentnode

      t.timestamps
    end
  end
end
