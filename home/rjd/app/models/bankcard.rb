class Bankcard < ApplicationRecord
  belongs_to :user
  belongs_to :bankdef
end
