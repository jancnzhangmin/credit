class CreateFeedbacks < ActiveRecord::Migration[5.2]
  def change
    create_table :feedbacks do |t|
      t.bigint :flow_id
      t.bigint :user_id
      t.integer :opinion
      t.text :summary

      t.timestamps
    end
  end
end
