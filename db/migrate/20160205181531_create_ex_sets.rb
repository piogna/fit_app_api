class CreateExSets < ActiveRecord::Migration
  def change
    create_table :ex_sets do |t|
      t.references :workout_exercise, index: true, foreign_key: true
      t.float :weight
      t.integer :reps
      t.integer :order

      t.timestamps null: false
    end
  end
end
