json.extract! member, :id, :name, :email, :birthday, :phone_number, :age, :primary_education, :secondary_education, :above_secondary, :skills, :created_at, :updated_at
json.url member_url(member, format: :json)
