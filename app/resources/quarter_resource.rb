class QuarterResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :season, :string
  attribute :year, :integer

  # Direct associations

  has_many :course_offerings

  # Indirect associations

  many_to_many :courses
end
