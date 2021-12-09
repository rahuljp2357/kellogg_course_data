class Course < ApplicationRecord
  # Direct associations

  has_many   :course_offerings,
             :dependent => :destroy

  # Indirect associations

  has_many   :quarters,
             :through => :course_offerings,
             :source => :quarter

  # Validations

  # Scopes

  def to_s
    course_number
  end

end
