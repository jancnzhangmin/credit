class AddNextuseridToFeedback < ActiveRecord::Migration[5.2]
  def change
    add_column :feedbacks, :nextuser_id, :bigint
  end
end
