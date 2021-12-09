class CreateUserNeeds < ActiveRecord::Migration[6.0]
  def change
    create_table :user_needs do |t|
      t.integer :facet_1_need
      t.integer :facet_2_need
      t.integer :facet_3_need
      t.integer :facet_4_need
      t.integer :facet_5_need
      t.integer :user_id

      t.timestamps
    end
  end
end
