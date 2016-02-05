class WorkoutExercise < ActiveRecord::Base
  has_many :ex_sets, dependent: :destroy
  belongs_to :workout

  validates :order, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :exercise_name, presence: true
end
