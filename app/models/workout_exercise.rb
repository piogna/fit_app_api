class WorkoutExercise < ActiveRecord::Base
  has_many :ex_sets
  belongs_to :workout
end
