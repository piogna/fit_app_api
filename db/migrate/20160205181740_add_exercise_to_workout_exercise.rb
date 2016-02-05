class AddExerciseToWorkoutExercise < ActiveRecord::Migration
  def change
    add_reference :workout_exercises, :exercise, index: true, foreign_key: true
  end
end
