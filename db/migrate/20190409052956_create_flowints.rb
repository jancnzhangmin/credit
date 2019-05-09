class CreateFlowints < ActiveRecord::Migration[5.2]
  def change
    create_table :flowints do |t|
      t.bigint :flowdetail_id
      t.integer :val
      t.integer :isnull
      t.string :isnullsummary

      t.timestamps
    end
  end
end
