class CreateFlowfloats < ActiveRecord::Migration[5.2]
  def change
    create_table :flowfloats do |t|
      t.bigint :flowdetail_id
      t.float :val
      t.integer :isnull
      t.string :isnullsummary

      t.timestamps
    end
  end
end
