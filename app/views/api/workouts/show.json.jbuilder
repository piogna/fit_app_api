json.id @workout.id
json.date @workout.date.to_date
json.workout_exercises_attributes @workout.workout_exercises do |workout_exercise|
  json.id workout_exercise.id
  json.exercise_name workout_exercise.exercise_name
  json.order workout_exercise.order
  json.ex_sets_attributes workout_exercise.ex_sets do |ex_set|
    json.id ex_set.id
    json.weight ex_set.weight
    json.reps ex_set.reps
    json.order ex_set.order
  end
end
