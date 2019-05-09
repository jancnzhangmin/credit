class CreateFlowdetails < ActiveRecord::Migration[5.2]
  def change
    create_table :flowdetails do |t|
      t.string :name

      t.timestamps
    end
  end
end
