class User < ApplicationRecord
  has_many :grants
  belongs_to :basesector, optional: true
  belongs_to :unionsector, optional: true
  belongs_to :basesector, optional: true
  has_many :usergroups
  has_many :opinions
  has_many :feedbacks
  has_and_belongs_to_many :usergroups
  has_many :userbusinadmins
  has_many :userfeedadmins
  has_secure_password
end
