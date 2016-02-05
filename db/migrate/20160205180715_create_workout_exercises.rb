class CreateWorkoutExercises < ActiveRecord::Migration
  def change
    create_table :workout_exercises do |t|
      t.references :workout, index: true, foreign_key: true
      t.integer :order

      t.timestamps null: false
    end
  end
end
