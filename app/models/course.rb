class Course < ApplicationRecord
  # Direct associations

  has_many   :course_offerings,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    course_number
  end

end
