class Opinion < ApplicationRecord
  belongs_to :flow
  belongs_to :user
end
