class Flow < ApplicationRecord
  has_many :flowdetails
  belongs_to :flowdef,optional: true
  has_many :flowfloats
  has_many :flowstrings
  has_many :flowtexts
  has_many :flowattachments
  has_many :flowints
  has_many :opinions
  has_many :feedbacks
  accepts_nested_attributes_for :feedbacks, allow_destroy: true
end
