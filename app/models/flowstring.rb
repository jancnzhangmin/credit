class Flowstring < ApplicationRecord
  belongs_to :flowdetail,optional: true
  belongs_to :flow
end
