class CreateConditions < ActiveRecord::Migration[5.2]
  def change
    create_table :conditions do |t|
      t.date :condition_date
      t.integer :meal
      t.integer :defecation
      t.integer :sleep
      t.integer :alcohol
      t.integer :exercise
      t.integer :stress
      t.integer :user_id

      t.timestamps
    end
  end
end
