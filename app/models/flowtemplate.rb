class Flowtemplate < ApplicationRecord
  has_many :grants
  belongs_to :cla
  has_many :wordints
  has_many :wordcoins
  has_many :dropdowns
  has_many :wordstrings
  has_many :wordtexts
  has_many :wordattches
  has_many :worddatetimes
end
