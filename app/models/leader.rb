class Leader < ApplicationRecord
  belongs_to :member
  belongs_to :department
end
