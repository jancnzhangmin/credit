class Unionsector < ApplicationRecord
  has_many :users
  belongs_to :cla
  has_many :flowdefs
end
