class AddCourseRatingReferenceToComments < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :comments, :course_ratings
    add_index :comments, :course_rating_id
    change_column_null :comments, :course_rating_id, false
  end
end
