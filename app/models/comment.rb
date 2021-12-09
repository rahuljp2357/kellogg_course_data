class Comment < ApplicationRecord
  # Direct associations

  belongs_to :course_rating

  belongs_to :user

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    user.to_s
  end
end
