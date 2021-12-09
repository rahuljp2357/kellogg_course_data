class ProfessorResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :prof_first_name, :string
  attribute :prof_second_name, :string

  # Direct associations

  # Indirect associations

end
