class CourseRatingResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer
  attribute :facet_1_rating, :integer
  attribute :facet_2_rating, :integer
  attribute :facet_3_rating, :integer
  attribute :facet_4_rating, :integer
  attribute :facet_5_rating, :integer
  attribute :descriptive_q1, :string
  attribute :descriptive_q2, :string
  attribute :descriptive_q3, :string
  attribute :course_offering_id, :integer

  # Direct associations

  # Indirect associations

end
