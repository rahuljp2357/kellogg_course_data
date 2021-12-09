class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :user_first_name, :string
  attribute :user_second_name, :string
  attribute :class_of, :integer

  # Direct associations

  has_one    :user_need

  has_many   :comments

  has_many   :course_ratings

  # Indirect associations

end
