json.extract! user, :id, :user_first_name, :user_second_name, :class_of,
              :created_at, :updated_at
json.url user_url(user, format: :json)
json.token user.generate_jwt
