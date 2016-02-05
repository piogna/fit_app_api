class AddExerciseNameToWorkoutExercise < ActiveRecord::Migration
  def change
    add_column :workout_exercises, :exercise_name, :string
  end
end
