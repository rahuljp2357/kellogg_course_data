json.extract! course_offering, :id, :course_id, :quarter_id, :prof_id, :created_at, :updated_at
json.url course_offering_url(course_offering, format: :json)
