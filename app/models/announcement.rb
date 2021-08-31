class Announcement < ApplicationRecord
  default_scope { order(date_to_air: :desc) }
end
