class Professor < ApplicationRecord
  # Direct associations

  has_many   :course_offerings,
             :foreign_key => "prof_id",
             :dependent => :destroy

  # Indirect associations

  has_many   :courses,
             :through => :course_offerings,
             :source => :course

  has_many   :course_ratings,
             :through => :course_offerings,
             :source => :course_ratings

  # Validations

  # Scopes

  def to_s
    prof_first_name
  end

end
