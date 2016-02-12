workout = Workout.new(date: Date.today)
we = WorkoutExercise.new(order: 1, exercise_name: "Some Exercise")
se = ExSet.new(order: 1, weight: 10, reps: 10)
we.ex_sets << se
workout.workout_exercises << we
workout.save
