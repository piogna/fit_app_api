json.array! @workouts do |workout|
  json.id workout.id
  json.date workout.date.to_date
end
