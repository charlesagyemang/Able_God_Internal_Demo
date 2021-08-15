class Department < ApplicationRecord
    has_many :leaders, dependent: :destroy
end
