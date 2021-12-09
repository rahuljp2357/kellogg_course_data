class CourseOffering < ApplicationRecord
  # Direct associations

  has_many   :course_ratings,
             :dependent => :destroy

  belongs_to :prof,
             :class_name => "Professor"

  belongs_to :course

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    course.to_s
  end

end
