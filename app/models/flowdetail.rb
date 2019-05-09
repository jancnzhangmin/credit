class Flowdetail < ApplicationRecord
  belongs_to :flow
  has_many :flowfloats
  has_many :flowstrings
  has_many :flowtexts
  has_many :flowattachments
  has_many :flowints
end
