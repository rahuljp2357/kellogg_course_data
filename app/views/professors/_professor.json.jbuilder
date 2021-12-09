json.extract! professor, :id, :prof_first_name, :prof_second_name, :created_at,
              :updated_at
json.url professor_url(professor, format: :json)
