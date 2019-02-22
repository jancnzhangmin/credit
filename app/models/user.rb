class User < ApplicationRecord
  has_many :grants
  belongs_to :basesector, optional: true
  belongs_to :unionsector, optional: true
  belongs_to :basesector, optional: true
  has_many :usergroups
  has_secure_password
end
