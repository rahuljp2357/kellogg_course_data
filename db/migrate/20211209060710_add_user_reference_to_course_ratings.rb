class AddUserReferenceToCourseRatings < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :course_ratings, :users
    add_index :course_ratings, :user_id
    change_column_null :course_ratings, :user_id, false
  end
end
