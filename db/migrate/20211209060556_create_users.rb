class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :user_first_name
      t.string :user_second_name
      t.integer :class_of

      t.timestamps
    end
  end
end
