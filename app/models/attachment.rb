class Attachment < ApplicationRecord
  belongs_to :flowattachment
  has_attached_file :attachment, :url => "/:attachment/:id/:basename.:extension",  :path => ":rails_root/public/:attachment/:id/:basename.:extension"
  do_not_validate_attachment_file_type :attachment
end
