class Usergroup < ApplicationRecord
  belongs_to :user
  belongs_to :auth
end
