class AddCourseReferenceToCourseOfferings < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :course_offerings, :courses
    add_index :course_offerings, :course_id
    change_column_null :course_offerings, :course_id, false
  end
end
