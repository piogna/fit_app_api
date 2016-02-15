class Workout < ActiveRecord::Base
  has_many :workout_exercises, dependent: :destroy

  accepts_nested_attributes_for :workout_exercises

  validates :date, presence: true

  validate :created_in_past_or_present, :must_have_workout_exercises

  private
  def created_in_past_or_present
    errors.add(:date, "Date must not be in the future") unless date && date < DateTime.now
  end

  def must_have_workout_exercises
    errors.add(:workout_exercises, 'Must have at least one Exercise') if workout_exercises.all?(&:marked_for_destruction?)
  end
end
