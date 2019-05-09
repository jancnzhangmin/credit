class Usergroup < ApplicationRecord
  has_and_belongs_to_many :auths
  has_and_belongs_to_many :users
end
