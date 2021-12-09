class AddUserReferenceToUserNeeds < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :user_needs, :users
    add_index :user_needs, :user_id
    change_column_null :user_needs, :user_id, false
  end
end
