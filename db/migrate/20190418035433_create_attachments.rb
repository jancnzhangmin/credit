class CreateAttachments < ActiveRecord::Migration[5.2]
  def change
    create_table :attachments do |t|
      t.bigint :flowattachment_id

      t.timestamps
    end
  end
end
