class ChangeCurrentnodeToFlow < ActiveRecord::Migration[5.2]
  def change
    change_table :flows do |t|
      t.change  :currentnode, :integer
    end
  end
end
