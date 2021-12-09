class ProfessorResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :prof_first_name, :string
  attribute :prof_second_name, :string

  # Direct associations

  has_many   :course_offerings,
             foreign_key: :prof_id

  # Indirect associations

end
