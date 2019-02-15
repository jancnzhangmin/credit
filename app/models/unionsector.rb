class Unionsector < ApplicationRecord
  has_many :user
  belongs_to :cla
end
