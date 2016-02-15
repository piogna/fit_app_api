class WorkoutSerializer < ActiveModel::Serializer
  attributes :id, :date

  has_many :workout_exercises, root: :workout_exercises_attributes
end
