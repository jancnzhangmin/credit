class Wordtype < ApplicationRecord
  belongs_to :flowdef
  belongs_to :wordtypedef, optional: true
  default_scope { order('corder') }
end
