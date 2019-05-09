class Flowdef < ApplicationRecord
  has_many :wordtypes
  accepts_nested_attributes_for :wordtypes, allow_destroy: true
  has_many :flows
  belongs_to :unionsector
end
