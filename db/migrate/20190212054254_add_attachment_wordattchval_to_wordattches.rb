class AddAttachmentWordattchvalToWordattches < ActiveRecord::Migration[5.2]
  def self.up
    change_table :wordattches do |t|
      t.attachment :wordattchval
    end
  end

  def self.down
    remove_attachment :wordattches, :wordattchval
  end
end
