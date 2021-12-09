class Quarter < ApplicationRecord
  # Direct associations

  has_many   :course_offerings,
             dependent: :destroy

  # Indirect associations

  has_many   :courses,
             through: :course_offerings,
             source: :course

  # Validations

  # Scopes

  def to_s
    season
  end
end
