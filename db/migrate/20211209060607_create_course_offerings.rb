class CreateCourseOfferings < ActiveRecord::Migration[6.0]
  def change
    create_table :course_offerings do |t|
      t.integer :course_id
      t.integer :quarter_id
      t.integer :prof_id

      t.timestamps
    end
  end
end
