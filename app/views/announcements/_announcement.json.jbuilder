json.extract! announcement, :id, :title, :message, :date_to_air, :created_at, :updated_at
json.url announcement_url(announcement, format: :json)
