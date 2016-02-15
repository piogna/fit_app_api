class WorkoutExerciseSerializer < ActiveModel::Serializer
  attributes :id, :exercise_name, :order

  has_many :ex_sets, root: :ex_sets_attributes
end
