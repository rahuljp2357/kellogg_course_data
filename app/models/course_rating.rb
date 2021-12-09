class CourseRating < ApplicationRecord
  # Direct associations

  has_many   :comments,
             :dependent => :destroy

  belongs_to :course_offering

  belongs_to :user

  # Indirect associations

  has_one    :prof,
             :through => :course_offering,
             :source => :prof

  # Validations

  # Scopes

  def to_s
    user.to_s
  end

end
