class ProfessorResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :prof_first_name, :string
  attribute :prof_second_name, :string

  # Direct associations

  has_many   :course_offerings,
             foreign_key: :prof_id

  # Indirect associations

  has_many :course_ratings do
    assign_each do |professor, course_ratings|
      course_ratings.select do |c|
        c.id.in?(professor.course_ratings.map(&:id))
      end
    end
  end

end
