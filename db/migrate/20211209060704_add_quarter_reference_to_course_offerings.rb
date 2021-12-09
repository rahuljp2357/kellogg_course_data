class AddQuarterReferenceToCourseOfferings < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :course_offerings, :quarters
    add_index :course_offerings, :quarter_id
    change_column_null :course_offerings, :quarter_id, false
  end
end
