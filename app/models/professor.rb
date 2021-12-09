class Professor < ApplicationRecord
  # Direct associations

  has_many   :course_offerings,
             :foreign_key => "prof_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    prof_first_name
  end

end
