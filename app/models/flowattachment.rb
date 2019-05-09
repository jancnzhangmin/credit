class Flowattachment < ApplicationRecord
  belongs_to :flowdef,optional: true
  belongs_to :flow
  has_many :attachments
end
