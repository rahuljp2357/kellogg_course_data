class CreateCourseRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :course_ratings do |t|
      t.integer :user_id
      t.integer :facet_1_rating
      t.integer :facet_2_rating
      t.integer :facet_3_rating
      t.integer :facet_4_rating
      t.integer :facet_5_rating
      t.string :descriptive_q1
      t.string :descriptive_q2
      t.string :descriptive_q3
      t.integer :course_offering_id

      t.timestamps
    end
  end
end
