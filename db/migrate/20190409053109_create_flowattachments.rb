class CreateFlowattachments < ActiveRecord::Migration[5.2]
  def change
    create_table :flowattachments do |t|
      t.integer :isnull
      t.string :isnullsummary

      t.timestamps
    end
  end
end
