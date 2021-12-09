class CourseResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :course_number, :string
  attribute :course_name, :string
  attribute :course_description, :string

  # Direct associations

  has_many   :course_offerings

  # Indirect associations

  many_to_many :quarters

end
