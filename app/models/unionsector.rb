class Unionsector < ApplicationRecord
  has_many :users
  belongs_to :cla
end
