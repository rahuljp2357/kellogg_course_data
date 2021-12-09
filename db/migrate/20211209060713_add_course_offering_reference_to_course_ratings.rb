class AddCourseOfferingReferenceToCourseRatings < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :course_ratings, :course_offerings
    add_index :course_ratings, :course_offering_id
    change_column_null :course_ratings, :course_offering_id, false
  end
end
