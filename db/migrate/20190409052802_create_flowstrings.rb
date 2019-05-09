class CreateFlowstrings < ActiveRecord::Migration[5.2]
  def change
    create_table :flowstrings do |t|
      t.bigint :flowdetail_id
      t.string :val
      t.integer :isnull
      t.string :isnullsummary

      t.timestamps
    end
  end
end
