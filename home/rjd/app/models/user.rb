class User < ApplicationRecord
  has_many :bankcards
  has_many :withdrawapps
  has_many :withdrawrecords
  has_many :tranapps
  has_secure_password
  has_attached_file :idfront, :url => "/:attachment/:id/:basename.:extension",  :path => ":rails_root/public/:attachment/:id/:basename.:extension"
  do_not_validate_attachment_file_type :idfront
  has_attached_file :idback, :url => "/:attachment/:id/:basename.:extension",  :path => ":rails_root/public/:attachment/:id/:basename.:extension"
  do_not_validate_attachment_file_type :idback
end
