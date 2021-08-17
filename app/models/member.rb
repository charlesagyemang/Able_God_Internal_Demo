class Member < ApplicationRecord
    has_many :leaders, dependent: :destroy
end
