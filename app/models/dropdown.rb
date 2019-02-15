class Dropdown < ApplicationRecord
  has_many :dropdownoptions
  belongs_to :flowtemplate
end
