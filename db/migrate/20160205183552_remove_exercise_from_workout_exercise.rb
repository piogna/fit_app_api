class RemoveExerciseFromWorkoutExercise < ActiveRecord::Migration
  def change
    remove_reference :workout_exercises, :exercise, index: true, foreign_key: true
  end
end
