class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :course_number
      t.string :course_name
      t.string :course_description

      t.timestamps
    end
  end
end
