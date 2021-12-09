class CourseOffering < ApplicationRecord
  # Direct associations

  belongs_to :course

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    course.to_s
  end

end
