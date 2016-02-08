class ExSet < ActiveRecord::Base
  belongs_to :workout_exercise

  validates :reps , presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :order , presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :weight , presence: true, numericality: { greater_than_or_equal_to: 0 }
end
