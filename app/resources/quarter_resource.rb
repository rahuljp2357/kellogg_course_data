class QuarterResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :season, :string
  attribute :year, :integer

  # Direct associations

  # Indirect associations

end
