class CreateQuarters < ActiveRecord::Migration[6.0]
  def change
    create_table :quarters do |t|
      t.string :season
      t.integer :year

      t.timestamps
    end
  end
end
