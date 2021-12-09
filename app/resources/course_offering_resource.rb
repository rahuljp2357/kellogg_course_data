class CourseOfferingResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :course_id, :integer
  attribute :quarter_id, :integer
  attribute :prof_id, :integer

  # Direct associations

  belongs_to :course

  # Indirect associations

end
