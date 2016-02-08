FactoryGirl.define do
  factory :ex_set do
    weight 10.0
    reps 10
    order 1
    workout_exercise
  end

  factory :workout_exercise do
    order 1
    exercise_name "Pulldown"
    workout
    before(:create) do |we|
      we.ex_sets << FactoryGirl.create(:ex_set, workout_exercise: we)
    end
  end

  factory :workout do
    date 1.day.ago
    before(:create) do |workout|
      workout.workout_exercises << FactoryGirl.create(:workout_exercise, workout: workout)
    end
  end
end
