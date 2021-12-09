class Quarter < ApplicationRecord
  # Direct associations

  has_many   :course_offerings,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    season
  end

end
