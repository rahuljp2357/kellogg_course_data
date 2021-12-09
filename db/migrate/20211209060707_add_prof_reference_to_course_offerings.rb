class AddProfReferenceToCourseOfferings < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :course_offerings, :professors, column: :prof_id
    add_index :course_offerings, :prof_id
    change_column_null :course_offerings, :prof_id, false
  end
end
