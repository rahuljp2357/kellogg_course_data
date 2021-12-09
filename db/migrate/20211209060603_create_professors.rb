class CreateProfessors < ActiveRecord::Migration[6.0]
  def change
    create_table :professors do |t|
      t.string :prof_first_name
      t.string :prof_second_name

      t.timestamps
    end
  end
end
