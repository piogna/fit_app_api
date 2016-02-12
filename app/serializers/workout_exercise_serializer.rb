class WorkoutExerciseSerializer < ActiveModel::Serializer
  attributes :id, :exercise_name, :order

  has_many :ex_sets
end
